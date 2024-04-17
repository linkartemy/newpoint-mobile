import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/article.dart';
import 'package:newpoint/components/drawer.dart';
import 'package:newpoint/components/post.dart';
import 'package:newpoint/components/refresh_indicator.dart';
import 'package:newpoint/domain/models/article/article.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/resources/resources.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/main/main_view_model.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  bool _isLoadingPosts = false;
  var _user;

  Future<void> getFeed() async {
    final model = Provider.of<MainViewModel>(context, listen: false);
    model.getFeed();
    setState(() {
      _isLoadingPosts = false;
    });
  }

  Future<void> getUser() async {
    final model = Provider.of<MainViewModel>(context, listen: false);
    await model.getUser();
    setState(() {
      _user = model.user;
    });
  }

  Future<void> loadPostById(int postId) async {
    final model = Provider.of<MainViewModel>(context, listen: false);
    await model.loadPostById(postId);
    setState(() {});
  }

  Future<void> loadArticleById(int articleId) async {
    final model = Provider.of<MainViewModel>(context, listen: false);
    await model.loadArticleById(articleId);
    setState(() {});
  }

  Future<void> reload() async {
    final model = Provider.of<MainViewModel>(context, listen: false);
    setState(() {
      _isLoadingPosts = true;
    });
    model.init();
    await getUser();
    await getFeed();
  }

  @override
  void initState() {
    final model = Provider.of<MainViewModel>(context, listen: false);
    super.initState();
    setState(() {
      _isLoadingPosts = true;
    });
    model.init();
    getUser();
    getFeed();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor:
            AdaptiveTheme.of(context).theme.scaffoldBackgroundColor,
        appBar: AppBar(
          shadowColor: AdaptiveTheme.of(context).theme.appBarTheme.shadowColor,
          backgroundColor:
              AdaptiveTheme.of(context).theme.appBarTheme.backgroundColor,
          title: Container(
              alignment: Alignment.centerRight,
              child: Image.asset(
                AdaptiveTheme.of(context).mode.isLight
                    ? AppImages.logoTitle
                    : AppImages.logoTitleDark,
                width: 100,
              )),
          bottom: TabBar(
            indicatorColor: AdaptiveTheme.of(context).theme.primaryColor,
            tabs: [
              Tab(
                child: Text(
                  AppLocalizations.of(context)!.forYou,
                  style: AdaptiveTheme.of(context).theme.textTheme.titleSmall,
                ),
              ),
              Tab(
                child: Text(
                  AppLocalizations.of(context)!.youRead,
                  style: AdaptiveTheme.of(context).theme.textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
        drawer: DrawerComponent(
          user: _user,
          reload: reload,
        ),
        body: TabBarView(children: [
          _PostsView(
            isLoading: _isLoadingPosts,
            reload: reload,
          ),
          _SubscribedPostsView(
            isLoading: _isLoadingPosts,
            reload: reload,
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AlertDialog alert = AlertDialog(
              actionsAlignment: MainAxisAlignment.start,
              actionsOverflowAlignment: OverflowBarAlignment.center,
              title: Text(
                AppLocalizations.of(context)!.actions,
                textAlign: TextAlign.center,
                style: AdaptiveTheme.of(context).theme.textTheme.titleLarge,
              ),
              actions: [
                TextButton(
                  child: Text(AppLocalizations.of(context)!.createPost,
                      textAlign: TextAlign.center),
                  onPressed: () async {
                    final postId = await Navigator.of(context)
                        .pushNamed(MainNavigationRouteNames.postCreator);
                    Navigator.of(context).pop();
                    if (postId != null) {
                      loadPostById(postId as int);
                    }
                  },
                ),
                TextButton(
                  child: Text(AppLocalizations.of(context)!.createArticle,
                      textAlign: TextAlign.center),
                  onPressed: () async {
                    final articleId = await Navigator.of(context)
                        .pushNamed(MainNavigationRouteNames.articleCreator);
                    Navigator.of(context).pop();
                    if (articleId != null) {
                      loadArticleById(articleId as int);
                    }
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: Icon(CupertinoIcons.pen),
        ),
      ),
    );
  }
}

class _PostsView extends StatefulWidget {
  const _PostsView({Key? key, required this.isLoading, required this.reload})
      : super(key: key);
  final bool isLoading;
  final Future<void> Function() reload;

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<_PostsView> {
  @override
  Widget build(BuildContext context) {
    Future<void> onRefresh() async {
      final model = Provider.of<MainViewModel>(context, listen: false);
      model.lastPostId = -1;
      model.lastArticleId = -1;
      await model.getUser();
      await model.getFeed();
      setState(() {});
    }

    final model = Provider.of<MainViewModel>(context);
    if (model.postsLoadingError.isNotEmpty) {
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
                  child: Text(model.postsLoadingError,
                      style: AdaptiveTheme.of(context)
                          .theme
                          .textTheme
                          .bodyMedium))));
    } else {
      var feed = model.feed;
      return (widget.isLoading
          ? const LoaderView()
          : RefreshIndicatorComponent(
              onRefresh: onRefresh,
              child: ListView.separated(
                  controller: model.feedScrollController,
                  key: PageStorageKey<String>("psk1"),
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: feed.length,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Divider(
                        color:
                            AdaptiveTheme.of(context).theme.dividerTheme.color,
                        thickness: 0.2,
                      )),
                  itemBuilder: (context, index) {
                    final model =
                        Provider.of<MainViewModel>(context, listen: false);
                    Future<void> onShareTap(BuildContext context) async {
                      model.share(feed[index].id);
                      setState(() {
                        feed[index].shares++;
                      });
                    }

                    Future<void> onLikeTap(BuildContext context) async {
                      await model.like(index);
                      setState(() {});
                    }

                    Future<void> onBookmarkTap() async {
                      await model.bookmark(index);
                      setState(() {});
                    }

                    Future<void> onPostTap(BuildContext context) async {
                      await Navigator.of(context).pushNamed(
                          MainNavigationRouteNames.post,
                          arguments: feed[index].id);
                      feed[index] = await model.getFeedEntry(feed[index]);
                      setState(() {});
                    }

                    Future<void> onArticleTap(BuildContext context) async {
                      await Navigator.of(context).pushNamed(
                          MainNavigationRouteNames.article,
                          arguments: feed[index].id);
                      feed[index] = await model.getFeedEntry(feed[index]);
                      setState(() {});
                    }

                    Future<void> deletePost() async {
                      await model.deletePost(feed[index].id);
                      setState(() {});
                    }

                    Future<void> addToBlacklist() async {
                      await model.addToBlacklist(feed[index].authorId);
                      setState(() {});
                    }

                    return VisibilityDetector(
                        key: Key('postkey$index'),
                        onVisibilityChanged: (visibilityInfo) async {
                          if (visibilityInfo.visibleFraction < 0.9) {
                            return;
                          }
                          if (index == feed.length - 1) {
                            await model.loadFeed();
                            setState(() {});
                          }
                          if (feed[index] is Article) {
                            if (!model.viewedArticles
                                    .contains(feed[index].id) &&
                                !model.isLoadingDatabase) {
                              model.viewedArticles.add(feed[index].id);
                              model.addArticleView(feed[index].id);
                              setState(() {
                                feed[index].views++;
                              });
                            }
                          } else {
                            if (!model.viewedPosts.contains(feed[index].id) &&
                                !model.isLoadingDatabase) {
                              model.viewedPosts.add(feed[index].id);
                              model.addPostView(feed[index].id);
                              setState(() {
                                feed[index].views++;
                              });
                            }
                          }
                        },
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            child: feed[index] is Post
                                ? PostComponent(
                                    id: feed[index].id,
                                    login: feed[index].login,
                                    name: feed[index].name,
                                    surname: feed[index].surname,
                                    profileImageId: feed[index].profileImageId,
                                    date: feed[index].creationTimestamp,
                                    content: feed[index].content,
                                    images: [],
                                    likes: feed[index].likes,
                                    liked: feed[index].liked,
                                    shares: feed[index].shares,
                                    comments: feed[index].comments,
                                    views: feed[index].views,
                                    onLikeTap: onLikeTap,
                                    onShareTap: onShareTap,
                                    onBookmarkTap: onBookmarkTap,
                                    onTap: onPostTap,
                                    canDelete:
                                        feed[index].authorId == model.user!.id,
                                    deletePost: deletePost,
                                    canAddToBlacklist:
                                        feed[index].authorId != model.user!.id,
                                    addToBlacklist: addToBlacklist,
                                  )
                                : ArticleComponent(
                                    id: feed[index].id,
                                    login: feed[index].login,
                                    name: feed[index].name,
                                    surname: feed[index].surname,
                                    profileImageId: feed[index].profileImageId,
                                    date: feed[index].creationTimestamp,
                                    title: (feed[index] as Article).title,
                                    content: feed[index].content,
                                    images: [],
                                    likes: feed[index].likes,
                                    liked: feed[index].liked,
                                    shares: feed[index].shares,
                                    comments: feed[index].comments,
                                    views: feed[index].views,
                                    onLikeTap: onLikeTap,
                                    onShareTap: onShareTap,
                                    onBookmarkTap: onBookmarkTap,
                                    onTap: onArticleTap,
                                    canDelete:
                                        feed[index].authorId == model.user!.id,
                                    deletePost: deletePost,
                                    canAddToBlacklist:
                                        feed[index].authorId != model.user!.id,
                                    addToBlacklist: addToBlacklist,
                                  )));
                  })));
    }
  }
}

class _SubscribedPostsView extends StatefulWidget {
  const _SubscribedPostsView(
      {Key? key, required this.isLoading, required this.reload})
      : super(key: key);
  final bool isLoading;
  final Future<void> Function() reload;

  @override
  _SubscribedPostsState createState() => _SubscribedPostsState();
}

class _SubscribedPostsState extends State<_SubscribedPostsView> {
  @override
  Widget build(BuildContext context) {
    Future<void> onRefresh() async {
      final model = Provider.of<MainViewModel>(context, listen: false);
      model.lastPostId = -1;
      model.lastArticleId = -1;
      await model.getSubscribedPosts();
      setState(() {});
    }

    final model = Provider.of<MainViewModel>(context);
    if (model.postsLoadingError.isNotEmpty) {
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
                  child: Text(model.postsLoadingError,
                      style: AdaptiveTheme.of(context)
                          .theme
                          .textTheme
                          .bodyMedium))));
    } else {
      var feed = model.subscribedPosts;
      return (widget.isLoading
          ? const LoaderView()
          : RefreshIndicatorComponent(
              onRefresh: onRefresh,
              child: ListView.separated(
                  controller: model.subscribedFeedScrollController,
                  key: PageStorageKey<String>("psk2"),
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: feed.length,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Divider(
                        color:
                            AdaptiveTheme.of(context).theme.dividerTheme.color,
                        thickness: 0.2,
                      )),
                  itemBuilder: (context, index) {
                    final model =
                        Provider.of<MainViewModel>(context, listen: false);
                    Future<void> onShareTap(BuildContext context) async {
                      model.share(feed[index].id);
                      setState(() {
                        feed[index].shares++;
                      });
                    }

                    Future<void> onLikeTap(BuildContext context) async {
                      await model.likeSubscribedPost(index);
                      setState(() {});
                    }

                    Future<void> onBookmarkTap() async {
                      await model.bookmark(index);
                      setState(() {});
                    }

                    Future<void> onPostTap(BuildContext context) async {
                      await Navigator.of(context).pushNamed(
                          MainNavigationRouteNames.post,
                          arguments: feed[index].id);
                      feed[index] = await model.getFeedEntry(feed[index]);
                    }

                    Future<void> onArticleTap(BuildContext context) async {
                      await Navigator.of(context).pushNamed(
                          MainNavigationRouteNames.article,
                          arguments: feed[index].id);
                      feed[index] = await model.getFeedEntry(feed[index]);
                    }

                    Future<void> deletePost() async {
                      await model.deletePost(feed[index].id);
                      setState(() {});
                    }

                    Future<void> addToBlacklist() async {
                      await model.addToBlacklist(feed[index].authorId);
                      setState(() {});
                    }

                    return VisibilityDetector(
                        key: Key('postkey$index'),
                        onVisibilityChanged: (visibilityInfo) async {
                          if (visibilityInfo.visibleFraction >= 0.9) {
                            if (index == feed.length - 1 && feed.length > 5) {
                              await model.loadSubscribedFeed();
                              setState(() {});
                            }
                            if (feed[index] is Article) {
                              if (!model.viewedArticles
                                      .contains(feed[index].id) &&
                                  !model.isLoadingDatabase) {
                                model.viewedArticles.add(feed[index].id);
                                model.addArticleView(feed[index].id);
                                setState(() {
                                  feed[index].views++;
                                });
                              }
                            } else {
                              if (!model.viewedPosts.contains(feed[index].id) &&
                                  !model.isLoadingDatabase) {
                                model.viewedPosts.add(feed[index].id);
                                model.addPostView(feed[index].id);
                                setState(() {
                                  feed[index].views++;
                                });
                              }
                            }
                          }
                        },
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            child: feed[index] is Post
                                ? PostComponent(
                                    id: feed[index].id,
                                    login: feed[index].login,
                                    name: feed[index].name,
                                    surname: feed[index].surname,
                                    profileImageId: feed[index].profileImageId,
                                    date: feed[index].creationTimestamp,
                                    content: feed[index].content,
                                    images: [],
                                    likes: feed[index].likes,
                                    liked: feed[index].liked,
                                    shares: feed[index].shares,
                                    comments: feed[index].comments,
                                    views: feed[index].views,
                                    onLikeTap: onLikeTap,
                                    onShareTap: onShareTap,
                                    onBookmarkTap: onBookmarkTap,
                                    onTap: onPostTap,
                                    canDelete:
                                        feed[index].authorId == model.user!.id,
                                    deletePost: deletePost,
                                    canAddToBlacklist:
                                        feed[index].authorId != model.user!.id,
                                    addToBlacklist: addToBlacklist,
                                  )
                                : ArticleComponent(
                                    id: feed[index].id,
                                    login: feed[index].login,
                                    name: feed[index].name,
                                    surname: feed[index].surname,
                                    profileImageId: feed[index].profileImageId,
                                    date: feed[index].creationTimestamp,
                                    title: (feed[index] as Article).title,
                                    content: feed[index].content,
                                    images: [],
                                    likes: feed[index].likes,
                                    liked: feed[index].liked,
                                    shares: feed[index].shares,
                                    comments: feed[index].comments,
                                    views: feed[index].views,
                                    onLikeTap: onLikeTap,
                                    onShareTap: onShareTap,
                                    onBookmarkTap: onBookmarkTap,
                                    onTap: onArticleTap,
                                    canDelete:
                                        feed[index].authorId == model.user!.id,
                                    deletePost: deletePost,
                                    canAddToBlacklist:
                                        feed[index].authorId != model.user!.id,
                                    addToBlacklist: addToBlacklist,
                                  )));
                  })));
    }
  }
}
