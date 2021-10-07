import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mahayog_real_estate_app/auth/sign_in.dart';
import 'package:mahayog_real_estate_app/auth/sign_up.dart';

import 'colors.dart';
import 'HomeScreen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: kPrimaryColor_light,
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Property IN Pocket",
                  style: TextStyle(
                      fontSize: 30
                  ),

                )
              ],
            ),
          ),
        ),
    );
  }

  void load() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
    });
  }
}
