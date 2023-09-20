import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/components/comment.dart';
import 'package:newpoint/components/dynamic_sliver_appbar.dart';
import 'package:newpoint/components/post.dart';
import 'package:newpoint/domain/models/comment/comment.dart';
import 'package:newpoint/domain/models/date_parser.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:newpoint/views/post/post_view_model.dart';
import 'package:newpoint/views/profile/profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  Future<void> onShareTap(BuildContext context, int id) async {
    final model = Provider.of<ProfileViewModel>(context, listen: false);
    model.share(id);
    setState(() {});
  }

  Future<void> onLikeTap(BuildContext context, int index) async {
    final model = Provider.of<ProfileViewModel>(context, listen: false);
    await model.like(index);
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
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileViewModel>(context);
    var profile = model.profile;

    return Scaffold(
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
                        headerSliverBuilder: (context, innerBoxIsScrolled) => [
                              DynamicSliverAppBar(
                                forceElevated: innerBoxIsScrolled,
                                maxHeight: 100,
                                implyLeading: true,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      _Header(
                                        login: profile.login,
                                        name: profile.name,
                                        surname: profile.surname,
                                        headerImageUrl:
                                            "https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg",
                                        profileImageUrl:
                                            "https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg",
                                      ),
                                      _Body(
                                        description: profile.description,
                                        location: profile.location,
                                        birthDate: profile.birthDate,
                                        registrationDate:
                                            profile.registrationTimestamp,
                                      ),
                                    ]),
                              ),
                            ],
                        body: _Footer(
                            onLikeTap: onLikeTap, onShareTap: onShareTap))));
  }
}

class _Header extends StatelessWidget {
  const _Header(
      {Key? key,
      required this.login,
      required this.name,
      required this.surname,
      required this.profileImageUrl,
      required this.headerImageUrl})
      : super(key: key);
  final String login;
  final String name;
  final String surname;
  final String profileImageUrl;
  final String headerImageUrl;

  Future<void> onDetailsTap() async {}

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileViewModel>(context);

    return Stack(
      children: [
        AspectRatio(
            aspectRatio: 2 / 1,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: FractionalOffset.topCenter,
                image: NetworkImage(headerImageUrl),
              )),
            )),
        Container(
            margin: const EdgeInsets.only(left: 10, top: 195),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(profileImageUrl),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16, left: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$name $surname",
                                style: AdaptiveTheme.of(context)
                                    .theme
                                    .textTheme
                                    .bodyMedium,
                              ),
                              Text(
                                "@$login",
                                style: AdaptiveTheme.of(context)
                                    .theme
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: CupertinoColors.secondaryLabel),
                              )
                            ]),
                      ),
                    ]),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        model.profileId == model.user!.id
                            ? Icons.account_circle_outlined
                            : CupertinoIcons.plus_circled,
                        size: 28,
                      )),
                )
              ],
            ))
      ],
    );
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
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          description != null
              ? Row(
                  children: [
                    const Icon(
                      CupertinoIcons.text_alignleft,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      description!,
                      style:
                          AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
                    )
                  ],
                )
              : Container(),
          description != null
              ? const SizedBox(
                  height: 5,
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
            "Since ${AppLocalizations.of(context)!.registrationDate(registrationDate!)}",
            style: AdaptiveTheme.of(context)
                .theme
                .textTheme
                .bodyMedium!
                .copyWith(color: CupertinoColors.secondaryLabel),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.nPosts(model.posts.length),
            style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    Key? key,
    required this.onLikeTap,
    required this.onShareTap,
  }) : super(key: key);
  final onLikeTap;
  final onShareTap;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileViewModel>(context);

    return ListView.builder(
        itemCount: model.posts.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final post = model.posts[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: PostComponent(
              id: post.id,
              login: post.login,
              name: post.name,
              surname: post.surname,
              date: post.creationTimestamp,
              content: post.content,
              images: [],
              likes: post.likes,
              liked: post.liked,
              shares: post.shares,
              comments: post.comments,
              onLikeTap: onLikeTap,
              onShareTap: onShareTap,
            ),
          );
        });
  }
}
