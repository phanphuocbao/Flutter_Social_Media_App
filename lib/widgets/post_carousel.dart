import 'package:flutter/material.dart';

import '../models/post_model.dart';

class PostsCarousel extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Post> posts;

  PostsCarousel(
      {required this.pageController, required this.posts, required this.title});

  _buildPost(BuildContext context, int index) {
    Post post = posts[index];

    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page! - index;
          value = (1 - (value.abs() * 0.25)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                height: 400.0,
                width: 300.0,
                fit: BoxFit.cover,
                image: AssetImage(
                  post.imageUrl.toString(),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 20,
            bottom: 10,
            child: Container(
              padding: EdgeInsets.all(12.0),
              height: 110.0,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    post.title.toString(),
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    post.location.toString(),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            post.likes.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.comment,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            post.comments.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            20.0,
            20.0,
            20.0,
            10.0,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          height: 400.0,
          child: PageView.builder(
              controller: pageController,
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildPost(context, index);
              }),
        )
      ],
    );
  }
}
