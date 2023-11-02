import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/components/drawer.dart';
import 'package:newpoint/components/post.dart';
import 'package:newpoint/resources/resources.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/main/main_view_model.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoadingPosts = true;
    });
    getPosts();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Image.asset(
              AppImages.logoTitleOutline,
              width: 100,
            ),
            centerTitle: true,
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
          ),
          body: TabBarView(children: [
            _PostsView(
              isLoading: _isLoadingPosts,
            ),
            _SubscribedPostsView(),
          ])),
    );
  }
}

class _PostsView extends StatefulWidget {
  const _PostsView({Key? key, required this.isLoading}) : super(key: key);
  final bool isLoading;

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<_PostsView> {
  @override
  Widget build(BuildContext context) {
    Future<void> onRefresh() async {
      final model = Provider.of<MainViewModel>(context, listen: false);
      await model.getPosts();
      await model.getUser();
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
                      final post = await Navigator.of(context).pushNamed(
                          MainNavigationRouteNames.post,
                          arguments: posts[index].id);
                      setState(() {
                        posts[index] = post;
                      });
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      child: PostComponent(
                          id: posts[index].id,
                          login: posts[index].login,
                          name: posts[index].name,
                          surname: posts[index].surname,
                          date: posts[index].creationTimestamp,
                          content: posts[index].content,
                          images: [],
                          likes: posts[index].likes,
                          liked: posts[index].liked,
                          shares: posts[index].shares,
                          comments: posts[index].comments,
                          onLikeTap: onLikeTap,
                          onShareTap: onShareTap,
                          onTap: onPostTap),
                    );
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
