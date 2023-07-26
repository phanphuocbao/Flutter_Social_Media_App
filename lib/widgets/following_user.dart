import 'package:flutter/material.dart';
import 'package:flutter_social_media_app_clone/data/data.dart';
import 'package:flutter_social_media_app_clone/models/user_model.dart';

class FollowingUser extends StatelessWidget {
  const FollowingUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            20.0,
            20.0,
            20.0,
            10.0,
          ),
          child: Text(
            'Following',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          height: 80.0,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              User user = users[index];

              return GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      )
                    ],
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image(
                      height: 60.0,
                      width: 60.0,
                      fit: BoxFit.cover,
                      image: AssetImage(user.profileImageUrl.toString()),
                    ),
                  ),
                ),
              );
            },
            itemCount: users.length,
          ),
        ),
      ],
    );
  }
}
