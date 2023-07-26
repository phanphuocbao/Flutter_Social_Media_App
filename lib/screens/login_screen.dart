import 'package:flutter/material.dart';
import 'package:flutter_social_media_app_clone/screens/home_screen.dart';
import 'package:flutter_social_media_app_clone/widgets/curve_clipper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              ClipPath(
                clipper: CurveClipper(),
                child: Image(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/login_background.jpg'),
                ),
              ),
              Text(
                'FRENZY',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 34.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 10.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'User Name',
                    prefixIcon: Icon(
                      Icons.account_box,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 30.0,
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen(),),),
                child: Container(
                  height: 45.0,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 60.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: (){},
                    child: Container(
                      alignment: Alignment.center,
                      height: 80.0,
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Don\'t have an account? sing up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
