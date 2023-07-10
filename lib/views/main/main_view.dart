import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/components/drawer.dart';
import 'package:newpoint/components/post.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/main/main_view_model.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  int _selectedTab = 0;
  bool _isLoadingPosts = false;
  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  Future<void> getPosts() async {
    final model = Provider.of<MainViewModel>(context, listen: false);
    await model.getPosts();
    setState(() {
      _isLoadingPosts = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoadingPosts = true;
    });
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(""),
            bottom: TabBar(
              indicatorColor: AdaptiveTheme.of(context).theme.primaryColor,
              tabs: [
                Tab(
                  child: Text(
                    "For you",
                    style: AdaptiveTheme.of(context).theme.textTheme.titleSmall,
                  ),
                ),
                Tab(
                  child: Text(
                    "You read",
                    style: AdaptiveTheme.of(context).theme.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
          drawer: DrawerComponent(),
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
    }

    final model = Provider.of<MainViewModel>(context);
    if (model.postsLoadingError.isNotEmpty) {
      return RefreshIndicator(
          onRefresh: onRefresh,
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(model.postsLoadingError,
                  style:
                      AdaptiveTheme.of(context).theme.textTheme.bodyMedium)));
    } else {
      var posts = model.posts();
      return (widget.isLoading
          ? const LoaderView()
          : RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView.builder(
                  itemCount: posts.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: PostComponent(
                        name: posts[index].name,
                        surname: posts[index].surname,
                        date: posts[index].creationTimestamp,
                        content: posts[index].content,
                        images: [],
                      ),
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
