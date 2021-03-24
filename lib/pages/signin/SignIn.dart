import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_villains/villain.dart';
import 'package:Swolly/pages/SignUp/SignUp.dart';
import 'package:Swolly/pages/dashboard/DashboardInitiator.dart';
import 'package:Swolly/pages/dashboard/DashboardUser.dart';
import 'package:Swolly/pages/signin/Provider.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Keys.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:Swolly/utils/res/Transitions.dart';

import 'ErrorPage.dart';

class SignIn extends StatefulWidget {
  @override
  SignInState createState() {
    return SignInState();
  }
}

class SignInState extends State<SignIn> {


  String email = "";
  String password = "";
  String textField1 = "Mail";
  String textField2 = "Password";

  GlobalKey<FormState> formKeySignIn  = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      backgroundColor: themeColor,
      body: Builder(
        builder: (context) => Form(
          key: formKeySignIn,
          child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SafeArea(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Hero(
                          tag: "logo",
                          child: Container(
                            height: 256,
                            margin: EdgeInsets.symmetric(vertical: 16),
                            child: Image(
                              image: AssetImage(
                                  "lib/assets/images/Logo-Final.png"
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox()
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                textField1,
                                style: loginH2,
                                textAlign: TextAlign.left,
                              )
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your mail';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff848A9C),width: 2)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff848A9C),width: 2)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green,width: 2)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red,width: 2)
                            ),
                            labelStyle: loginH2,
                          ),
                          style: loginH1,
                          onSaved: (value){
                            email = value;
                          },
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              margin: EdgeInsets.only(top: 16, bottom: 8),
                              child: Text(
                                textField2,
                                style: loginH2,
                                textAlign: TextAlign.left,
                              )
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff848A9C),width: 2)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff848A9C),width: 2)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green,width: 2)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red,width: 2)
                            ),
                            labelStyle: loginH2,
                          ),
                          style: loginH1,
                          onSaved: (value){
                            password = value;
                          },
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 32,bottom: 4),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: ButtonTheme(
                              height: 64,
                              minWidth: double.infinity,
                              child: FlatButton(
                                color: Color(0xff00AA4F),
                                textColor: Colors.white,
                                onPressed: (){
                                  if (formKeySignIn.currentState.validate()) {
                                    formKeySignIn.currentState.save();
                                    SignInProvider.signInProvider(email, password).then((value){
                                      if (value == 200){
                                        if (userRole=="INITIATOR" || userRole=="ADMIN"){
                                          Navigator.of(context).pushReplacement(FadeRouteBuilder(page: DashboardInitiator()));
                                        } else {
                                          Navigator.of(context).pushReplacement(FadeRouteBuilder(page: DashboardUser()));
                                        }
                                      }else if (establishedConnection == false) {
                                        Navigator.of(context).push(FadeRouteBuilder(page: ErrorPage()));
                                      } else {
                                        Scaffold.of(context)
                                            .showSnackBar(SnackBar(content: Text(value)));
                                      }
                                    });
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                    "LOGIN",
                                    style: TextStyle(fontSize: 18, color: Colors.white, letterSpacing: 0.5)
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4,bottom: 16),
                          child: ButtonTheme(
                            height: 40,
                            minWidth: double.infinity,
                            child: FlatButton(
                              color: Colors.transparent,
                              textColor: Colors.white,
                              onPressed: (){
                                formKeySignIn.currentState.reset();
                                Navigator.of(context).push(FadeRouteBuilder(page: SignUp()));
                                },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(fontSize: 18, color: Color(0xff00AA4F), letterSpacing: 0.5),
                              ),
                            ),
                          ),
                        )
                      ]
                  ),)
              )
          ),
        ),
      )
    );
  }
}