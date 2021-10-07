// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mahayog_real_estate_app/HomeScreen/featured.dart';
import 'package:mahayog_real_estate_app/HomeScreen/header.dart';
import 'package:mahayog_real_estate_app/HomeScreen/recommended.dart';
import 'package:mahayog_real_estate_app/HomeScreen/title.dart';
import 'package:mahayog_real_estate_app/details.dart';
import 'package:mahayog_real_estate_app/auth/sign_up.dart';
import 'package:mahayog_real_estate_app/colors.dart';
import 'package:mahayog_real_estate_app/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _advancedDrawerController = AdvancedDrawerController();
  String more= "More";
  String country = "India";
  String? user= FirebaseAuth.instance.currentUser?.email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AdvancedDrawer(
      backdropColor: nav_baground,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 500),
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: Drawer_home(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (context, value, child) {
                return Icon(
                  value.visible ? Icons.clear : Icons.menu,
                );
              },
            ),
          ),
          actions: [
            IconButton(
                onPressed: (){
                  if(FirebaseAuth.instance.currentUser == null){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> SignUp()));
                  }else{
                    Fluttertoast.showToast(msg: "User Profile Delete");
                    FirebaseAuth.instance.currentUser?.delete();
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> HomeScreen()));
                  }
                },
                icon: FirebaseAuth.instance.currentUser != null ? Icon(Icons.exit_to_app) :
                Icon(Icons.person)  // exit_to_app
            )
          ],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(size: size, user: user),
              titles(title: "Recommended"),
              recommended(size: size, country: country),
              titles(title: "Featured"),
              SizedBox(height: 10),
              featured(size: size, country: country),

            ],
          ),
        )
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

}
