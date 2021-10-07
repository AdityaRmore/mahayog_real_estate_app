
import 'package:flutter/material.dart';


class Drawer_home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 24.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/user.jpg',
                ),
              ),
              SizedBox(height: 8,),
              const Text(
                "demo@gmail.com",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white70
                ),
              ),
              SizedBox(height: 30,),


              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavigation()));
                  },
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavigation()));

                  },
                  leading: Icon(Icons.apps),
                  title: Text('All Categories'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Exit'),
                ),
              ),
              Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
