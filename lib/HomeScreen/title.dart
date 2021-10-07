
import 'package:flutter/material.dart';
import 'package:mahayog_real_estate_app/AllProperty/all.dart';
import 'package:mahayog_real_estate_app/colors.dart';

class titles extends StatelessWidget {
  const titles({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 24,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: kDefaultPadding / 4),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kPrimaryColor),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.only(right: kDefaultPadding / 4),
                      height: 7,
                      color: kPrimaryColor.withOpacity(0.2),
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: kPrimaryColor,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> AllProperty()));
              },
              child: const Text(
                "More",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
