import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsfeed/compnents/alreadyhaveanactcheck.dart';
import 'package:newsfeed/compnents/forgot_password.dart';
import 'package:newsfeed/compnents/rounded_button.dart';
import 'package:newsfeed/compnents/rounded_input_field.dart';
import 'package:newsfeed/compnents/rounded_password_field.dart';
import 'package:newsfeed/signin/signin.dart';
import 'package:newsfeed/signin/signinparse.dart';

import 'compnents/signin_divider_text.dart';
import 'network/apimanager.dart';
import 'network/signupapi.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String userName="abc",password="abc",cnfp="abc";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: new AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover),
          ),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                child: Text(
                  'Welcome!!',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 0.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0))),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),

                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.black, fontSize: 25.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: [
                          RoundedInputField(
                              hintText: 'Email:', onChanged: (value) =>userName = value),
                          RoundedPasswordField(onChanged: (value) => password=value),
                          RoundedPasswordField(onChanged: (value) => cnfp=value),

                          ElevatedButton(
                            onPressed: (){
                              showLoaderDialog(context);
                              _signInCall(context);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue.shade600),
                            ),
                          ),
                        ],
                      ),

                    ),
                    SignInDivider(text: 'Or Sign In with'),
                    Container(
                      height: 40.0,
                      // alignment: Alignment.center,
                      margin: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Image.asset('assets/images/google.png',height: 30.0,width: 65.0,),

                          Image.asset('assets/images/facebook.png',height: 40.0)
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account'),
                        GestureDetector(
                          onTap: (){
                            callSignUp(context);
                          },
                          child: Text('SignIn',style: TextStyle(color: Colors.deepOrange),),
                        )
                      ],
                    )


                  ],
                ),
              ),
            ],
          )),
    );
  }

  _signInCall(BuildContext context) async {

    var response = await new SignUpApi().signUpNetworkCall(userName,password,cnfp);
    var decoded;

    try {
      decoded = new SignInParse.fromJson(response);
      String res=decoded.success;
      if(res=="Success!") {

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      }else{
        //String res=decoded.success;
        print("sign in res ${decoded.success}");
        showError(res,context);
      }
    } catch (e) {
      print("error");

    }
  }

  hello() {
    print("test function");
  }

  void showError(String success, BuildContext context) {
    setState(() {
      final snackBar = new SnackBar(
        content: Text(
          success,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,

          ),
        ),
        backgroundColor: Colors.red,
        //width: MediaQuery.of(context).size.width,
        //padding:EdgeInsets.all(8.0),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  callSignUp(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignIn()));
  }
}
