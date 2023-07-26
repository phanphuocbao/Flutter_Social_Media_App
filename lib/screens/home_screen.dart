import 'package:flutter/material.dart';
import 'package:flutter_social_media_app_clone/data/data.dart';
import 'package:flutter_social_media_app_clone/models/user_model.dart';
import 'package:flutter_social_media_app_clone/widgets/custom_drawer.dart';
import 'package:flutter_social_media_app_clone/widgets/following_user.dart';
import 'package:flutter_social_media_app_clone/widgets/post_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.white,
        title: Text(
          'FRENZY',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 10.0,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
            controller: _tabController,
            labelColor: Theme.of(context).primaryColor,
            labelStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(fontSize: 18.0),
            indicatorWeight: 3.5,
            tabs: [
              Tab(
                text: 'Trendy',
              ),
              Tab(
                text: 'Latest',
              ),
            ]),
      ),
      drawer: CustomDrawer(),
      body: ListView(children: [
        FollowingUser(),
        PostsCarousel(
          pageController: _pageController,
          title: 'Posts',
          posts: posts,
        ),
      ]),
    );
  }
}
