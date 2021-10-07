// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomeScreen/title.dart';
import 'colors.dart';
import 'HomeScreen/home_screen.dart';


class Details extends StatefulWidget {


  List detail;
  Details({Key? key, required this.detail}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  List data= [];
  String country = "India";
  @override
  void initState() {
    // TODO: implement initState
    data= widget.detail;
    print(data);
    print(FirebaseAuth.instance.currentUser?.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: size.height/3 +50,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -10),
                      blurRadius: 35,
                      color: kPrimaryColor.withOpacity(0.58),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                  child: Image.asset('assets/images/pp-2.jpeg', fit: BoxFit.cover,),
                ),

              ),
              SizedBox(height: 30,),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        data[0],
                      style: TextStyle(
                        fontSize: 40,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10,),
                    const Text(
                      "SK Barodawala Marg, Tardeo, Mumbai,"
                    ),
                    const SizedBox(height: 3,),
                    const Text(" Maharashtra 400026")
                  ],
                ),
              ),

              SizedBox(height: 40,),

              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 50,
                  // color: Colors.grey,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: const Center(
                          child: Icon(Icons.stars, color: kPrimaryColor,),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Center(
                            child: Text(
                              "Information",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 100,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: kPrimaryColor_light,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: size.width/3 -10,
                        // color: Colors.grey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 60,
                              width: size.width/3 -10,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.corporate_fare_outlined),
                                    Text("20,00")
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: size.width/3 -10,
                              // color: Colors.redAccent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  SizedBox(height: 2,),
                                  Text(
                                    "Area Sqft",
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: size.width/3 -10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 60,
                              width: size.width/3 -10,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.bed),
                                    Text("8")
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: size.width/3 -10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  SizedBox(height: 2,),
                                  Text(
                                    "Bed Rooms",
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                ],
                              )
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width/3 -10,
                        // color: Colors.grey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 60,
                              width: size.width/3 -10,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.bathtub),
                                    Text("4")
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: size.width/3 -10,
                              // color: Colors.redAccent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  SizedBox(height: 2,),
                                  Text(
                                    "BathRooms",
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  )
                                ],
                              )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20,),
              titles(title: "Recommended"),
              SizedBox(
                height: 235,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Featured")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.data?.docs.length == 0) {
                      return Center(child: Text("No Data"));
                    }
                    var it = snapshot.data?.docs;
                    // new_widget(allResults: _allResults);
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index){
                        var price = it![index]['price'];
                        var img = it[index]['image'];
                        var title = it[index]['title'];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_)=> Details(detail: [
                                  it[index]['title'],
                                  it[index]['image'],
                                  it[index]['price']
                                ],))
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: kDefaultPadding,
                              top: kDefaultPadding / 2,
                              bottom: kDefaultPadding * 1,
                            ),
                            width: size.width * 0.4,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                    height: 150,
                                    width: double.infinity,
                                    // child: Text("Image"),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(20)
                                        ),
                                        child: Image.network(img, fit: BoxFit.fill,))
                                ),
                                Container(
                                  padding: EdgeInsets.all(kDefaultPadding / 2),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: kPrimaryColor.withOpacity(0.23),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "$title\n".toUpperCase(),
                                                style: Theme.of(context).textTheme.button),
                                            TextSpan(
                                              text: "$country".toUpperCase(),
                                              style: TextStyle(
                                                color: kPrimaryColor.withOpacity(0.5),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),

                                      Text(
                                        '\$$price',
                                        style: Theme.of(context)
                                            .textTheme
                                            .button,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },

                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration( // ignore: prefer_const_constructors
          color: Colors.white,
        ),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          color: kPrimaryColor,
          onPressed: () {
          },
          child: Text(
            "Shop Now",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
