import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/article.dart';
import 'package:newpoint/components/dynamic_sliver_appbar.dart';
import 'package:newpoint/components/post.dart';
import 'package:newpoint/components/profile_image.dart';
import 'package:newpoint/components/refresh_indicator.dart';
import 'package:newpoint/domain/factories/screen_factory.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:newpoint/views/profile/profile_view_model.dart';
import 'package:newpoint/views/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends State<ProfileView> {
  bool _isLoadingProfile = false;

  Future<void> onRefresh() async {
    final model = Provider.of<ProfileViewModel>(context, listen: false);
    await getUser();
    await getProfile();
    if (model.error.isEmpty) {
      await getPosts();
    }
  }

  Future<void> getProfile() async {
    final model = Provider.of<ProfileViewModel>(context, listen: false);
    await model.getProfile();
    setState(() {});
  }

  Future<void> getUser() async {
    final model = Provider.of<ProfileViewModel>(context, listen: false);
    await model.getUser();
    setState(() {});
  }

  Future<void> getIsFollowing() async {
    final model = Provider.of<ProfileViewModel>(context, listen: false);
    await model.getIsFollowing();
    setState(() {});
  }

  Future<void> getPosts() async {
    final model = Provider.of<ProfileViewModel>(context, listen: false);
    await model.getPosts();
    setState(() {
      _isLoadingProfile = false;
    });
  }

  Future<void> reload() async {
    final model = Provider.of<ProfileViewModel>(context, listen: false);
    await getProfile();
    await model.getIsFollowing();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoadingProfile = true;
    });
    getUser();
    getProfile();
    getIsFollowing();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileViewModel>(context);
    var profile = model.profile;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor:
                AdaptiveTheme.of(context).theme.scaffoldBackgroundColor,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              surfaceTintColor:
                  AdaptiveTheme.of(context).theme.appBarTheme.surfaceTintColor,
              bottomOpacity: 0,
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
            ),
            body: RefreshIndicatorComponent(
                onRefresh: onRefresh,
                notificationPredicate: (ScrollNotification notification) {
                  if (model.error.isNotEmpty ||
                      _isLoadingProfile ||
                      profile == null) {
                    return notification.depth == 0;
                  }
                  return notification.depth == 2;
                },
                child: model.error.isNotEmpty
                    ? SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            vertical: 300, horizontal: 10),
                        child: Text(model.error,
                            style: AdaptiveTheme.of(context)
                                .theme
                                .textTheme
                                .bodyMedium))
                    : _isLoadingProfile || profile == null
                        ? const LoaderView()
                        : NestedScrollView(
                            headerSliverBuilder: (context,
                                    innerBoxIsScrolled) =>
                                [
                                  DynamicSliverAppBar(
                                      forceElevated: innerBoxIsScrolled,
                                      maxHeight: 1000,
                                      implyLeading: false,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 16),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              _Header(),
                                              _Body(),
                                              SizedBox(
                                                height: 24,
                                              ),
                                              TabBar(
                                                indicatorColor:
                                                    AdaptiveTheme.of(context)
                                                        .theme
                                                        .primaryColor,
                                                tabs: [
                                                  Tab(
                                                    child: Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .posts,
                                                      style: AdaptiveTheme.of(
                                                              context)
                                                          .theme
                                                          .textTheme
                                                          .titleSmall,
                                                    ),
                                                  ),
                                                  Tab(
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                        SizedBox(
                                                          width: 50,
                                                        ),
                                                        Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .articles,
                                                          style:
                                                              AdaptiveTheme.of(
                                                                      context)
                                                                  .theme
                                                                  .textTheme
                                                                  .titleSmall,
                                                        ),
                                                        SizedBox(
                                                          width: 25,
                                                        ),
                                                        InkWell(
                                                          onTap: () {},
                                                          child: Icon(
                                                            Icons.search,
                                                            color: AppColors
                                                                .primary,
                                                          ),
                                                        ),
                                                      ])),
                                                ],
                                              )
                                            ]),
                                      )),
                                ],
                            body: TabBarView(children: [
                              _FooterPosts(
                                reload: reload,
                              ),
                              _FooterArticles(
                                reload: reload,
                              ),
                            ])))));
  }
}

class _Header extends StatefulWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  Future<void> onDetailsTap() async {}

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileViewModel>(context);

    Future<void> follow() async {
      await model.follow();
    }

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              model.profileId == model.user?.id
                  ? InkWell(
                      onTap: () async {
                        AlertDialog alert = AlertDialog(
                          actionsAlignment: MainAxisAlignment.start,
                          actionsOverflowAlignment: OverflowBarAlignment.center,
                          title: Text(
                            AppLocalizations.of(context)!.profileImages,
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
                                      .changeProfileImage,
                                  textAlign: TextAlign.center),
                              onPressed: () async {
                                await model.onImageTap();
                                setState(() {});
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                                onPressed: () async {
                                  Navigator.of(context).pushNamed(
                                      MainNavigationRouteNames.imageViewer,
                                      arguments: model.profile!.profileImageId);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.openPhoto,
                                  textAlign: TextAlign.center,
                                )),
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
                      child: ProfileImage(
                        profileImageId: model.profile!.profileImageId,
                      ))
                  : InkWell(
                      onTap: () async {
                        Navigator.of(context).pushNamed(
                            MainNavigationRouteNames.imageViewer,
                            arguments: model.profile!.profileImageId);
                      },
                      child: ProfileImage(
                          profileImageId: model.profile!.profileImageId)),
              Container(
                margin: const EdgeInsets.only(top: 0, left: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 210,
                        child: Text(
                          "${model.profile!.name} ${model.profile!.surname}",
                          style: AdaptiveTheme.of(context)
                              .theme
                              .textTheme
                              .bodyLarge,
                        ),
                      ),
                      SizedBox(
                          width: 210,
                          child: Text(
                            "@${model.profile!.login}",
                            style: AdaptiveTheme.of(context)
                                .theme
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: AdaptiveTheme.of(context)
                                        .theme
                                        .colorScheme
                                        .secondary),
                          ))
                    ]),
              ),
            ]),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: model.profileId == model.user!.id
                  ? IconButton(
                      onPressed: () async {
                        model.profile = await showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF737373),
                                      borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(25.0),
                                          topRight:
                                              const Radius.circular(25.0))),
                                  child: ScreenFactory()
                                      .makeProfileEditor(model.profileId));
                            });
                        await model.getProfile();
                      },
                      icon: Icon(
                        Icons.account_circle_outlined,
                        size: 28,
                      ))
                  : IconButton(
                      onPressed: follow,
                      icon: model.following
                          ? Icon(CupertinoIcons.minus)
                          : Icon(CupertinoIcons.plus)),
            )
          ],
        ));
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileViewModel>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 21,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${model.profile!.followers} ",
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleSmall!
                            .copyWith(),
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.followers,
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleSmall!
                            .copyWith(
                              color: AdaptiveTheme.of(context)
                                  .theme
                                  .colorScheme
                                  .secondary,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${model.profile!.following} ",
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleSmall,
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.following,
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleSmall!
                            .copyWith(
                              color: AdaptiveTheme.of(context)
                                  .theme
                                  .colorScheme
                                  .secondary,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10)
              ]),
          const SizedBox(height: 8),
          model.profile!.description != null
              ? Text(
                  model.profile!.description!,
                  style: AdaptiveTheme.of(context).theme.textTheme.bodyLarge,
                )
              : Container(),
          model.profile!.description != null
              ? const SizedBox(
                  height: 21,
                )
              : Container(),
          model.profile!.location != null
              ? Row(
                  children: [
                    const Icon(
                      CupertinoIcons.placemark,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      model.profile!.location!,
                      style:
                          AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
                    )
                  ],
                )
              : Container(),
          model.profile!.location != null
              ? const SizedBox(
                  height: 5,
                )
              : Container(),
          Row(
            children: [
              const Icon(
                CupertinoIcons.calendar,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                AppLocalizations.of(context)!
                    .birthDate(model.profile!.birthDate!),
                style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            AppLocalizations.of(context)!
                .registrationDate(model.profile!.registrationTimestamp!),
            style: AdaptiveTheme.of(context)
                .theme
                .textTheme
                .bodyMedium!
                .copyWith(
                    color:
                        AdaptiveTheme.of(context).theme.colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}

class _FooterPosts extends StatefulWidget {
  const _FooterPosts({Key? key, required this.reload}) : super(key: key);

  final Future<void> Function() reload;

  @override
  _FooterPostsState createState() => _FooterPostsState();
}

class _FooterPostsState extends State<_FooterPosts> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileViewModel>(context);

    Future<void> onShareTap(BuildContext context, int index) async {
      model.share(index);
      setState(() {});
    }

    Future<void> onLikeTap(BuildContext context, int index) async {
      await model.like(index);
      setState(() {});
    }

    Future<void> onBookmarkTap(int index) async {
      await model.bookmark(index);
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

    return ListView.builder(
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
                if (model.lastPostId == model.previousPostId ||
                    visibilityInfo.visibleFraction < 0.9 ||
                    model.posts.length < 5) {
                  return;
                }
                await model.loadPostsFeed();
                setState(() {});
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: PostComponent(
                  id: post.id,
                  login: post.login,
                  name: post.name,
                  surname: post.surname,
                  profileImageId: post.profileImageId,
                  date: post.creationTimestamp,
                  content: post.content,
                  images: [],
                  likes: post.likes,
                  liked: post.liked,
                  shares: post.shares,
                  comments: post.comments,
                  views: post.views,
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
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: PostComponent(
              id: post.id,
              login: post.login,
              name: post.name,
              surname: post.surname,
              profileImageId: post.profileImageId,
              date: post.creationTimestamp,
              content: post.content,
              images: [],
              likes: post.likes,
              liked: post.liked,
              shares: post.shares,
              comments: post.comments,
              views: post.views,
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
        });
  }
}

class _FooterArticles extends StatefulWidget {
  const _FooterArticles({Key? key, required this.reload}) : super(key: key);

  final Future<void> Function() reload;

  @override
  _FooterArticlesState createState() => _FooterArticlesState();
}

class _FooterArticlesState extends State<_FooterArticles> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileViewModel>(context);

    Future<void> onShareTap(BuildContext context, int index) async {
      model.share(index);
      setState(() {});
    }

    Future<void> onLikeTap(BuildContext context, int index) async {
      await model.like(index);
      setState(() {});
    }

    Future<void> onBookmarkTap(int index) async {
      await model.bookmark(index);
      setState(() {});
    }

    Future<void> deletePost(int postId) async {
      await model.deletePost(postId);
      setState(() {});
    }

    Future<void> onTap(BuildContext context, int index) async {
      await Navigator.of(context).pushNamed(MainNavigationRouteNames.post,
          arguments: model.articles[index].id);
      model.articles[index] = await model.getArticleById(model.articles[index]);
      widget.reload();
      setState(() {});
    }

    return ListView.builder(
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
                  if (model.lastArticleId == model.previousArticleId ||
                      visibilityInfo.visibleFraction < 0.9 ||
                      model.articles.length < 5) {
                    return;
                  }
                  await model.loadArticlesFeed();
                  setState(() {});
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
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
                ));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
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
        });
  }
}
