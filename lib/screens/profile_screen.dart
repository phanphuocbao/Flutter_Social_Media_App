import 'package:flutter/material.dart';
import 'package:flutter_social_media_app_clone/data/data.dart';
import 'package:flutter_social_media_app_clone/models/user_model.dart';
import 'package:flutter_social_media_app_clone/widgets/custom_drawer.dart';
import 'package:flutter_social_media_app_clone/widgets/post_carousel.dart';

import '../widgets/profile_clipper.dart';

class ProFileScreen extends StatefulWidget {
  final User user;
  const ProFileScreen({super.key, required this.user});

  @override
  State<ProFileScreen> createState() => _ProFileScreenState();
}

class _ProFileScreenState extends State<ProFileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _pageController;
  late PageController _farvoriteController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    _farvoriteController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: ProfileClipper(),
                child: Image(
                  height: 300.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: AssetImage(
                    widget.user.backgroundImageUrl.toString(),
                  ),
                ),
              ),
              Positioned(
                top: 50.0,
                left: 20.0,
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 30.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                ),
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image(
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        widget.user.profileImageUrl.toString(),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            widget.user.name.toString(),
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Following',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    widget.user.following.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Followers',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    widget.user.followers.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          PostsCarousel(
              pageController: _pageController,
              posts: widget.user.posts!,
              title: 'Your Posts'),
          PostsCarousel(
              pageController: _farvoriteController,
              posts: widget.user.favorites!,
              title: 'Farvorites'),
          SizedBox(height: 50.0,),
        ],
      )),
    );
  }
}
