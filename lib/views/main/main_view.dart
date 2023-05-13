import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/components/drawer.dart';

import '../../components/post.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
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
            _PostsView(),
            _SubscribedPostsView(),
          ])),
    );
  }
}

class _PostsView extends StatelessWidget {
  final arr = <String>{
    "1432",
    "wrgrwg",
    "32fd2",
    "23f2",
    "ewf",
    "34yt34y",
    "rgwgwrg",
    "wefwgwr",
    "dvbebe",
    "erhgreh"
  };
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: arr.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: PostComponent(),
          );
        });
  }
}

class _SubscribedPostsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
