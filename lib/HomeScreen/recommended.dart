
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mahayog_real_estate_app/colors.dart';

import '../details.dart';


class recommended extends StatelessWidget {
  const recommended({
    Key? key,
    required this.size,
    required this.country,
  }) : super(key: key);

  final Size size;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index){
              var price = it![index]['price'];
              var img = it![index]['image'];
              var title = it![index]['title'];
              return GestureDetector(
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
                                    text: country.toUpperCase(),
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
    );
  }
}



