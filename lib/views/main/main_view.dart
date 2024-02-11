import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/drawer.dart';
import 'package:newpoint/components/post.dart';
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

  Future<void> getPosts() async {
    final model = Provider.of<MainViewModel>(context, listen: false);
    await model.getPosts();
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

  Future<void> reload() async {
    setState(() {
      _isLoadingPosts = true;
    });
    await getUser();
    await getPosts();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoadingPosts = true;
    });
    getUser();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
              alignment: Alignment.centerRight,
              child: Image.asset(
                AppImages.logoTitleOutline,
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
          _SubscribedPostsView(),
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
                    await Navigator.of(context)
                        .pushNamed(MainNavigationRouteNames.postCreator);
                    Navigator.of(context).pop();
                    await getPosts();
                  },
                ),
                TextButton(
                  child: Text(AppLocalizations.of(context)!.createArticle,
                      textAlign: TextAlign.center),
                  onPressed: () async {
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
      await model.getUser();
      await model.getPosts();
      setState(() {});
    }

    final model = Provider.of<MainViewModel>(context);
    if (model.postsLoadingError.isNotEmpty) {
      return RefreshIndicator(
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
      var posts = model.posts;
      return (widget.isLoading
          ? const LoaderView()
          : RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView.builder(
                  itemCount: posts.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final model =
                        Provider.of<MainViewModel>(context, listen: false);
                    Future<void> onShareTap(BuildContext context) async {
                      model.share(posts[index].id);
                      setState(() {
                        posts[index].shares++;
                      });
                    }

                    Future<void> onLikeTap(BuildContext context) async {
                      setState(() {
                        posts[index].liked = !posts[index].liked;
                      });
                      if (!posts[index].liked) {
                        setState(() {
                          posts[index].likes--;
                        });
                        await model.unlike(posts[index].id);
                      } else {
                        setState(() {
                          posts[index].likes++;
                        });
                        await model.like(posts[index].id);
                      }
                    }

                    Future<void> onPostTap(BuildContext context) async {
                      await Navigator.of(context).pushNamed(
                          MainNavigationRouteNames.post,
                          arguments: posts[index].id);
                      await widget.reload();
                    }

                    Future<void> deletePost() async {
                      await model.deletePost(posts[index].id);
                      setState(() {});
                    }

                    return VisibilityDetector(
                        key: Key('postkey$index'),
                        onVisibilityChanged: (visibilityInfo) async {
                          if (visibilityInfo.visibleFraction >= 0.9) {
                            if (!model.viewedPosts.contains(posts[index].id) &&
                                !model.isLoadingDatabase) {
                              model.viewedPosts.add(posts[index].id);
                              await model.addView(posts[index].id);
                              setState(() {
                                posts[index].views++;
                              });
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          child: PostComponent(
                            id: posts[index].id,
                            login: posts[index].login,
                            name: posts[index].name,
                            surname: posts[index].surname,
                            profileImageId: posts[index].profileImageId,
                            date: posts[index].creationTimestamp,
                            content: posts[index].content,
                            images: [],
                            likes: posts[index].likes,
                            liked: posts[index].liked,
                            shares: posts[index].shares,
                            comments: posts[index].comments,
                            views: posts[index].views,
                            onLikeTap: onLikeTap,
                            onShareTap: onShareTap,
                            onTap: onPostTap,
                            canDelete: posts[index].authorId == model.user!.id,
                            deletePost: deletePost,
                          ),
                        ));
                  })));
    }
  }
}

class _SubscribedPostsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
