import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mahayog_real_estate_app/auth/sign_up.dart';
import 'package:mahayog_real_estate_app/colors.dart';
import 'package:mahayog_real_estate_app/HomeScreen/home_screen.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  var _formkey = GlobalKey<FormState>();
  bool isloading = false;

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  Future<void> signup(BuildContext context) async{

    setState(() {
      isloading=true;
    });
    try{
        Null userCredential = await FirebaseAuth
            .instance
            .signInWithEmailAndPassword(
            email: _email.text,
            password: _password.text
        ).then((value) async {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
          Fluttertoast.showToast(msg: "Successfull");
        }).catchError((onError){
          print("=========================");
          // Fluttertoast.showToast(msg: "error " + FlutterError.onError.toString());
          Fluttertoast.showToast(msg: "error :" +  " No User Found");
        });

    }catch(e){
        Fluttertoast.showToast(msg: "Error while Login Retry ");
    }
      // uploadData(_username.text);


    setState(() {
      isloading=false;
    });

  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: isloading ? Center(child: CircularProgressIndicator()) :
      SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Container(
            // color: Colors.redAccent,
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height/4,),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 30,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 70),
                Container(
                  // color: CupertinoColors.systemGrey,
                  width: size.width,
                  // height: 330,
                  child: Padding(
                    padding: EdgeInsets.all(35),
                    child: Container(
                      // color: nav_baground,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: kPrimaryColor, width: 2),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, top:4, bottom: 4),
                                child: TextFormField(
                                  controller: _email,
                                  validator:  (item){
                                    return item!.contains("@") ? null : "Enter Valid Email";
                                  },
                                  decoration: const InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    hintText: " Email",
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: kPrimaryColor, width: 2),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, top:4, bottom: 4),
                                child: TextFormField(
                                  controller: _password,
                                  validator: (item){
                                    return item!.isNotEmpty ? null : "Password Must Contain 6 digit";
                                  },
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    hintText: "Password",
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    // border: new OutlineInputBorder(
                                    //     borderRadius: new BorderRadius.circular(25.0),
                                    //     borderSide: new BorderSide()
                                    // )
                                    // focusedBorder: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(25.0),
                                    //   borderSide: BorderSide(
                                    //     color: Colors.blue,
                                    //   ),
                                    // ),

                                    // enabledBorder: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(25.0),
                                    //   borderSide: BorderSide(
                                    //     color: kPrimaryColor,
                                    //     width: 2.0,
                                    //   ),
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 60),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextButton(
                                onPressed: (){
                                  if (_formkey.currentState!.validate()){
                                    signup(context);
                                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> HomeScreen()));
                                  }
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: GestureDetector(
                        child: Text("Create a new account"),
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> SignUp()));
                        },
                      ),
                    )
                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
