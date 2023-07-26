import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter_social_media_app_clone/data/data.dart';
import 'package:flutter_social_media_app_clone/screens/home_screen.dart';
import 'package:flutter_social_media_app_clone/screens/login_screen.dart';
import 'package:flutter_social_media_app_clone/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  _buildDrawerOption(Icon icon, String title, Function() onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage(
                  currentUser.backgroundImageUrl.toString(),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child:
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 3.0, color: Theme.of(context).primaryColor),
                    ),
                    child: ClipOval(
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          currentUser.profileImageUrl.toString(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  Text(
                    currentUser.name.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ],
          ),
          _buildDrawerOption(
            Icon(Icons.dashboard),
            'Home',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(
            Icon(Icons.comment),
            'Chats',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(
            Icon(Icons.location_on),
            'Map',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(
            Icon(Icons.account_circle),
            'Your Profile',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ProFileScreen(user: currentUser),
              ),
            ),
          ),
          _buildDrawerOption(
            Icon(Icons.settings),
            'Settings',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildDrawerOption(
                Icon(Icons.directions_run),
                'LogOut',
                    () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
