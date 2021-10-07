import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mahayog_real_estate_app/colors.dart';
import 'package:mahayog_real_estate_app/details.dart';

class AllProperty extends StatefulWidget {
  const AllProperty({Key? key}) : super(key: key);

  @override
  _AllPropertyState createState() => _AllPropertyState();
}

class _AllPropertyState extends State<AllProperty> {

  String country = "India";



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Container(
              height: 100,
              width: size.width,
              decoration: BoxDecoration(
                // color: Colors.redAccent,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "Featured Property",
                  style: TextStyle(
                    fontSize: 35
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Featured")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.data?.docs.length == 0) {
                    return Center(child: const Text("No Data"));
                  }
                  var it = snapshot.data?.docs;
                  return StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 5,
                      itemCount: snapshot.data!.docs.length,
                      // itemCount: _allResults.length,
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
                            // color: Colors.redAccent,
                            margin: const EdgeInsets.only(
                              left: kDefaultPadding/2,
                              right: kDefaultPadding/2,
                              // top: kDefaultPadding / 2,
                              // bottom: kDefaultPadding * 1,
                            ),
                            width: double.infinity,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                    height: index==0 ? 130 : 200,
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
                                ),
                                // Text('$index')
                              ],
                            ),
                          ),
                        );
                      },
                      staggeredTileBuilder: (index)=> StaggeredTile.count(2, index==0 ? 2 : 2.5)

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
