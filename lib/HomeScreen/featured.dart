import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mahayog_real_estate_app/colors.dart';
import 'package:mahayog_real_estate_app/details.dart';

class featured extends StatelessWidget {
  const featured({
    Key? key,
    required this.size,
    required this.country,
  }) : super(key: key);

  final Size size;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
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
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index){
              var price = it![index]['price'];
              var img = it![index]['image'];
              var title = it![index]['title'];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_)=> Details(detail: [
                          it![index]['title'],
                          it![index]['image'],
                          it![index]['price']
                        ],))
                    );
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          height: double.infinity,
                          width: ((size.width * 2 )/3)-8,
                          color: kPrimaryColor_light,
                          child: Image.network(img, fit: BoxFit.fill,),
                        ),
                        Container(
                          height: double.infinity,
                          width: (size.width /3)-8,
                          color: kPrimaryColor_light,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 30),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "$title\n".toUpperCase(),
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                    TextSpan(
                                      text: "$country".toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 60),
                              Text(
                                '\$$price',
                                style: Theme.of(context)
                                    .textTheme
                                    .button,
                              ),
                              FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: kPrimaryColor,
                                onPressed: (){

                                },
                                child: Text(
                                  "Buy",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),

                        )
                      ],
                    ),
                  ),
                ),
              );
            },

          );
        },
      ),
    );
  }
}



