import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/article.dart';
import 'package:newpoint/components/post.dart';
import 'package:newpoint/components/refresh_indicator.dart';
import 'package:newpoint/views/bookmarks/bookmarks_view_model.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BookmarksView extends StatefulWidget {
  const BookmarksView({Key? key}) : super(key: key);

  @override
  BookmarksViewState createState() => BookmarksViewState();
}

class BookmarksViewState extends State<BookmarksView> {
  bool _isLoading = false;

  Future<void> onRefresh() async {
    final model = Provider.of<BookmarksViewModel>(context, listen: false);
    await getUser();
    model.init();
  }

  Future<void> getUser() async {
    final model = Provider.of<BookmarksViewModel>(context, listen: false);
    await model.getUser();
    await model.getPosts();
    await model.getArticles();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> reload() async {
    final model = Provider.of<BookmarksViewModel>(context, listen: false);
    await model.getUser();
    setState(() {});
    model.init();
  }

  @override
  void initState() {
    super.initState();
    final model = Provider.of<BookmarksViewModel>(context, listen: false);
    setState(() {
      _isLoading = true;
    });
    getUser();
    model.init();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BookmarksViewModel>(context);

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor:
              AdaptiveTheme.of(context).theme.scaffoldBackgroundColor,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            shadowColor:
                AdaptiveTheme.of(context).theme.appBarTheme.shadowColor,
            backgroundColor:
                AdaptiveTheme.of(context).theme.appBarTheme.backgroundColor,
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back_rounded, size: 25),
            ),
            title: Container(
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () async {
                      AlertDialog alert = AlertDialog(
                        actionsAlignment: MainAxisAlignment.start,
                        actionsOverflowAlignment: OverflowBarAlignment.center,
                        title: Text(
                          AppLocalizations.of(context)!.actions,
                          textAlign: TextAlign.center,
                          style: AdaptiveTheme.of(context)
                              .theme
                              .textTheme
                              .titleLarge,
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                                AppLocalizations.of(context)!
                                    .deleteAllBookmarks,
                                textAlign: TextAlign.center),
                            onPressed: () async {
                              AlertDialog alert = AlertDialog(
                                actionsAlignment: MainAxisAlignment.start,
                                actionsOverflowAlignment:
                                    OverflowBarAlignment.center,
                                title: Text(
                                  AppLocalizations.of(context)!.areYouSure,
                                  textAlign: TextAlign.center,
                                  style: AdaptiveTheme.of(context)
                                      .theme
                                      .textTheme
                                      .titleLarge,
                                ),
                                actions: [
                                  TextButton(
                                    child: Text(
                                        AppLocalizations.of(context)!.yes,
                                        textAlign: TextAlign.center),
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                      await model.deleteAllBookmarks();
                                      setState(() {});
                                    },
                                  ),
                                  TextButton(
                                    child: Text(
                                      AppLocalizations.of(context)!.cancel,
                                      textAlign: TextAlign.center,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert;
                                },
                              );
                            },
                          ),
                          TextButton(
                            child: Text(
                              AppLocalizations.of(context)!.cancel,
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                    child: Icon(Icons.more_horiz_rounded, size: 25))),
            bottom: TabBar(
              indicatorColor: AdaptiveTheme.of(context).theme.primaryColor,
              tabs: [
                Tab(
                  child: Text(
                    AppLocalizations.of(context)!.posts,
                    style: AdaptiveTheme.of(context).theme.textTheme.titleSmall,
                  ),
                ),
                Tab(
                  child: Text(
                    AppLocalizations.of(context)!.articles,
                    style: AdaptiveTheme.of(context).theme.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            _PostsView(
              reload: reload,
              isLoading: _isLoading,
            ),
            _ArticlesView(
              reload: reload,
              isLoading: _isLoading,
            ),
          ]),
        ));
  }
}

class _PostsView extends StatefulWidget {
  const _PostsView({Key? key, required this.reload, required this.isLoading})
      : super(key: key);

  final Future<void> Function() reload;
  final bool isLoading;

  @override
  _PostsViewState createState() => _PostsViewState();
}

class _PostsViewState extends State<_PostsView> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BookmarksViewModel>(context);

    Future<void> onRefresh() async {
      final model = Provider.of<BookmarksViewModel>(context, listen: false);
      model.lastPostId = -1;
      await model.getUser();
      await model.getPosts();
      setState(() {});
    }

    Future<void> onShareTap(BuildContext context, int index) async {
      model.share(index);
      setState(() {});
    }

    Future<void> onLikeTap(BuildContext context, int index) async {
      await model.like(index);
      setState(() {});
    }

    Future<void> onBookmarkTap(int index) async {
      await model.bookmarkPost(index);
      setState(() {});
    }

    Future<void> deletePost(int postId) async {
      await model.deletePost(postId);
      setState(() {});
    }

    Future<void> onTap(BuildContext context, int index) async {
      await Navigator.of(context).pushNamed(MainNavigationRouteNames.post,
          arguments: model.posts[index].id);
      model.posts[index] = await model.getPostById(model.posts[index]);
      widget.reload();
      setState(() {});
    }

    if (model.error.isNotEmpty) {
      return RefreshIndicatorComponent(
          onRefresh: onRefresh,
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 0;
          },
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Text(model.error,
                      style: AdaptiveTheme.of(context)
                          .theme
                          .textTheme
                          .bodyMedium))));
    } else {
      return (widget.isLoading
          ? const LoaderView()
          : RefreshIndicatorComponent(
              onRefresh: onRefresh,
              child: model.posts.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      child: Text(
                          AppLocalizations.of(context)!.thereIsNothingHere,
                          style: AdaptiveTheme.of(context)
                              .theme
                              .textTheme
                              .titleLarge))
                  : ListView.builder(
                      key: PageStorageKey<String>("psk2"),
                      itemCount: model.posts.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var post = model.posts[index];
                        if (index == model.posts.length - 1) {
                          return VisibilityDetector(
                            key: Key('postkey$index'),
                            onVisibilityChanged: (visibilityInfo) async {
                              if (visibilityInfo.visibleFraction < 0.9 ||
                                  model.posts.length < 5) {
                                return;
                              }
                              await model.loadPostsFeed();
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 24),
                              child: PostComponent(
                                post: post,
                                onLikeTap: (BuildContext context) async {
                                  await onLikeTap(context, index);
                                },
                                onShareTap: (BuildContext context) async {
                                  await onShareTap(context, index);
                                },
                                onBookmarkTap: () async {
                                  await onBookmarkTap(index);
                                },
                                onTap: (BuildContext context) async {
                                  if (post.id == -1) {
                                    return;
                                  }
                                  await onTap(context, index);
                                },
                                canDelete: post.authorId == model.user!.id,
                                deletePost: () async {
                                  await deletePost(post.id);
                                },
                                canAddToBlacklist:
                                    post.authorId != model.user!.id,
                                addToBlacklist: () async {
                                  await model.addToBlacklist(post.authorId);
                                },
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 24),
                          child: PostComponent(
                            post: post,
                            onLikeTap: (BuildContext context) async {
                              await onLikeTap(context, index);
                            },
                            onShareTap: (BuildContext context) async {
                              await onShareTap(context, index);
                            },
                            onBookmarkTap: () async {
                              await onBookmarkTap(index);
                            },
                            onTap: (BuildContext context) async {
                              if (post.id == -1) {
                                return;
                              }
                              await onTap(context, index);
                            },
                            canDelete: post.authorId == model.user!.id,
                            deletePost: () async {
                              await deletePost(post.id);
                            },
                            canAddToBlacklist: post.authorId != model.user!.id,
                            addToBlacklist: () async {
                              await model.addToBlacklist(post.authorId);
                            },
                          ),
                        );
                      })));
    }
  }
}

class _ArticlesView extends StatefulWidget {
  const _ArticlesView({Key? key, required this.reload, required this.isLoading})
      : super(key: key);

  final Future<void> Function() reload;
  final bool isLoading;

  @override
  _ArticlesViewState createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<_ArticlesView> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BookmarksViewModel>(context);

    Future<void> onRefresh() async {
      model.lastArticleId = -1;
      await model.getArticles();
      setState(() {});
    }

    Future<void> onShareTap(BuildContext context, int index) async {
      model.share(index);
      setState(() {});
    }

    Future<void> onLikeTap(BuildContext context, int index) async {
      await model.like(index);
      setState(() {});
    }

    Future<void> onBookmarkTap(int index) async {
      await model.bookmarkArticle(index);
      setState(() {});
    }

    Future<void> deletePost(int postId) async {
      await model.deletePost(postId);
      setState(() {});
    }

    Future<void> onTap(BuildContext context, int index) async {
      await Navigator.of(context).pushNamed(MainNavigationRouteNames.article,
          arguments: model.articles[index].id);
      model.articles[index] = await model.getArticleById(model.articles[index]);
      widget.reload();
      setState(() {});
    }

    return (widget.isLoading
        ? const LoaderView()
        : RefreshIndicatorComponent(
            onRefresh: onRefresh,
            child: model.articles.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    child: Text(
                        AppLocalizations.of(context)!.thereIsNothingHere,
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleLarge))
                : ListView.builder(
                    key: PageStorageKey<String>("article_feed_psk"),
                    itemCount: model.articles.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var article = model.articles[index];
                      if (index == model.articles.length - 1) {
                        return VisibilityDetector(
                            key: Key('articlekey$index'),
                            onVisibilityChanged: (visibilityInfo) async {
                              if (visibilityInfo.visibleFraction < 0.9 ||
                                  model.articles.length < 5) {
                                return;
                              }
                              await model.loadArticlesFeed();
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 24),
                              child: ArticleComponent(
                                id: article.id,
                                login: article.login,
                                name: article.name,
                                surname: article.surname,
                                profileImageId: article.profileImageId,
                                date: article.creationTimestamp,
                                title: article.title,
                                content: article.content,
                                images: [],
                                likes: article.likes,
                                liked: article.liked,
                                bookmarked: article.bookmarked,
                                shares: article.shares,
                                comments: article.comments,
                                views: article.views,
                                onLikeTap: (BuildContext context) async {
                                  await onLikeTap(context, index);
                                },
                                onShareTap: (BuildContext context) async {
                                  await onShareTap(context, index);
                                },
                                onBookmarkTap: () async {
                                  await onBookmarkTap(index);
                                },
                                onTap: (BuildContext context) async {
                                  if (article.id == -1) {
                                    return;
                                  }
                                  await onTap(context, index);
                                },
                                canDelete: article.authorId == model.user!.id,
                                deletePost: () async {
                                  await deletePost(article.id);
                                },
                                canAddToBlacklist:
                                    article.authorId != model.user!.id,
                                addToBlacklist: () async {
                                  await model.addToBlacklist(article.authorId);
                                },
                              ),
                            ));
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 24),
                        child: ArticleComponent(
                          id: article.id,
                          login: article.login,
                          name: article.name,
                          surname: article.surname,
                          profileImageId: article.profileImageId,
                          date: article.creationTimestamp,
                          title: article.title,
                          content: article.content,
                          images: [],
                          likes: article.likes,
                          liked: article.liked,
                          bookmarked: article.bookmarked,
                          shares: article.shares,
                          comments: article.comments,
                          views: article.views,
                          onLikeTap: (BuildContext context) async {
                            await onLikeTap(context, index);
                          },
                          onShareTap: (BuildContext context) async {
                            await onShareTap(context, index);
                          },
                          onBookmarkTap: () async {
                            await onBookmarkTap(index);
                          },
                          onTap: (BuildContext context) async {
                            if (article.id == -1) {
                              return;
                            }
                            await onTap(context, index);
                          },
                          canDelete: article.authorId == model.user!.id,
                          deletePost: () async {
                            await deletePost(article.id);
                          },
                          canAddToBlacklist: article.authorId != model.user!.id,
                          addToBlacklist: () async {
                            await model.addToBlacklist(article.authorId);
                          },
                        ),
                      );
                    })));
  }
}
