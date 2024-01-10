import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/dynamic_sliver_appbar.dart';
import 'package:newpoint/components/post.dart';
import 'package:newpoint/components/profile_image.dart';
import 'package:newpoint/domain/factories/screen_factory.dart';
import 'package:newpoint/domain/models/post/post.dart';
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

  Future<void> getPosts() async {
    final model = Provider.of<ProfileViewModel>(context, listen: false);
    await model.getPosts();
    setState(() {
      _isLoadingProfile = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoadingProfile = true;
    });
    getUser();
    getProfile();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileViewModel>(context);
    var profile = model.profile;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back_rounded, size: 25),
              ),
            ),
            body: RefreshIndicator(
                onRefresh: onRefresh,
                notificationPredicate: (ScrollNotification notification) {
                  if (model.error.isNotEmpty ||
                      _isLoadingProfile ||
                      profile == null) return notification.depth == 0;
                  return notification.depth == 1;
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
                                              _Header(
                                                login: profile.login,
                                                name: profile.name,
                                                surname: profile.surname,
                                                headerImage: [],
                                              ),
                                              _Body(
                                                description:
                                                    profile.description,
                                                location: profile.location,
                                                birthDate: profile.birthDate,
                                                registrationDate: profile
                                                    .registrationTimestamp,
                                              ),
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
                              _FooterPosts(),
                              _FooterArticles(),
                            ])))));
  }
}

class _Header extends StatefulWidget {
  const _Header(
      {Key? key,
      required this.login,
      required this.name,
      required this.surname,
      required this.headerImage})
      : super(key: key);

  final String login;
  final String name;
  final String surname;
  final List<int> headerImage;

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  Future<void> onDetailsTap() async {}

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileViewModel>(context);

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () async {
                        if (model.profileId == model.user?.id) {
                          AlertDialog alert = AlertDialog(
                            actionsAlignment: MainAxisAlignment.start,
                            actionsOverflowAlignment:
                                OverflowBarAlignment.center,
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
                        }
                      },
                      child: ProfileImage(
                        profileImageId: model.profile!.profileImageId,
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 0, left: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.name} ${widget.surname}",
                            style: AdaptiveTheme.of(context)
                                .theme
                                .textTheme
                                .bodyLarge,
                          ),
                          Text(
                            "@${widget.login}",
                            style: AdaptiveTheme.of(context)
                                .theme
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: CupertinoColors.secondaryLabel),
                          )
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
                  : IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            )
          ],
        ));
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.description,
    required this.location,
    required this.birthDate,
    required this.registrationDate,
  }) : super(key: key);

  final String? description;
  final String? location;
  final DateTime? birthDate;
  final DateTime? registrationDate;

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
          description != null
              ? Text(
                  description!,
                  style: AdaptiveTheme.of(context).theme.textTheme.bodyLarge,
                )
              : Container(),
          description != null
              ? const SizedBox(
                  height: 21,
                )
              : Container(),
          location != null
              ? Row(
                  children: [
                    const Icon(
                      CupertinoIcons.placemark,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      location!,
                      style:
                          AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
                    )
                  ],
                )
              : Container(),
          location != null
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
                AppLocalizations.of(context)!.birthDate(birthDate!),
                style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            AppLocalizations.of(context)!.registrationDate(registrationDate!),
            style: AdaptiveTheme.of(context)
                .theme
                .textTheme
                .bodyMedium!
                .copyWith(color: CupertinoColors.secondaryLabel),
          ),
        ],
      ),
    );
  }
}

class _FooterPosts extends StatefulWidget {
  const _FooterPosts({Key? key}) : super(key: key);

  @override
  _FooterPostsState createState() => _FooterPostsState();
}

class _FooterPostsState extends State<_FooterPosts> {
  Future<void> onShareTap(BuildContext context, int index) async {
    final model = Provider.of<ProfileViewModel>(context, listen: false);
    model.share(index);
    setState(() {});
  }

  Future<void> onLikeTap(BuildContext context, int index) async {
    final model = Provider.of<ProfileViewModel>(context, listen: false);
    await model.like(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileViewModel>(context);

    return ListView.builder(
        itemCount: model.posts.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var post = model.posts[index];
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
              onTap: (BuildContext context) async {
                final postUpdated = await Navigator.of(context).pushNamed(
                    MainNavigationRouteNames.post,
                    arguments: post.id);
                setState(() {
                  model.posts[index] = postUpdated as Post;
                });
              },
            ),
          );
        });
  }
}

class _FooterArticles extends StatefulWidget {
  const _FooterArticles({Key? key}) : super(key: key);

  @override
  _FooterArticlesState createState() => _FooterArticlesState();
}

class _FooterArticlesState extends State<_FooterArticles> {
  Future<void> onShareTap(BuildContext context, int index) async {
    final model = Provider.of<ProfileViewModel>(context, listen: false);
    model.share(index);
    setState(() {});
  }

  Future<void> onLikeTap(BuildContext context, int index) async {
    final model = Provider.of<ProfileViewModel>(context, listen: false);
    await model.like(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileViewModel>(context);

    return ListView.builder(
        itemCount: model.posts.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var post = model.posts[index];
          return VisibilityDetector(
              key: Key('postkey$index'),
              onVisibilityChanged: (visibilityInfo) async {
                if (visibilityInfo.visibleFraction >= 0.9) {
                  if (!model.viewedPosts.contains(model.posts[index].id) &&
                      !model.isLoadingDatabase) {
                    model.viewedPosts.add(post.id);
                    await model.addView(post.id);
                    setState(() {
                      post.views++;
                    });
                  }
                }
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
                  onTap: (BuildContext context) async {
                    final postUpdated = await Navigator.of(context).pushNamed(
                        MainNavigationRouteNames.post,
                        arguments: post.id);
                    setState(() {
                      model.posts[index] = postUpdated as Post;
                    });
                  },
                ),
              ));
        });
  }
}
