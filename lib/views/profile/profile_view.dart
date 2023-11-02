import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
                        headerSliverBuilder: (context, innerBoxIsScrolled) => [
                              DynamicSliverAppBar(
                                forceElevated: innerBoxIsScrolled,
                                maxHeight: 1000,
                                implyLeading: false,
                                child: Padding(padding: EdgeInsets.only(top: 16),child: Column(
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
                              )),
                            ],
                        body: const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: _Footer(),
                        ))));
  }
}

class _Header extends StatefulWidget {
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
                        await model.onImageTap();
                        setState(() {});
                      },
                      child: CircleAvatar(
                        radius: 36,
                        backgroundImage: NetworkImage(widget.profileImageUrl),
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
            height: 16,
          ),
          description != null
              ? Text(
                  description!,
                  style: AdaptiveTheme.of(context).theme.textTheme.bodyLarge,
                )
              : Container(),
          description != null
              ? const SizedBox(
                  height: 16,
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
        ],
      ),
    );
  }
}

class _Footer extends StatefulWidget {
  const _Footer({Key? key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<_Footer> {
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
          final post = model.posts[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: PostComponent(
              id: post.id,
              login: post.login,
              name: post.name,
              surname: post.surname,
              profileImage: const NetworkImage(
                  "https://yt3.googleusercontent.com/ytc/APkrFKa1J_iBVN8AD7RUkNXfRJvcVK_Y0bzmxnX1t-ee=s176-c-k-c0x00ffffff-no-rj"),
              date: post.creationTimestamp,
              content: post.content,
              images: [],
              likes: post.likes,
              liked: post.liked,
              shares: post.shares,
              comments: post.comments,
              onLikeTap: (BuildContext context) async {
                await onLikeTap(context, index);
              },
              onShareTap: (BuildContext context) async {
                await onShareTap(context, index);
              },
            ),
          );
        });
  }
}
