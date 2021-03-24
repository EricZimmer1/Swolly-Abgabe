import 'package:Swolly/pages/dashboard/DashboardInitiator.dart';
import 'package:Swolly/pages/signin/ErrorPage.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_villains/villain.dart';
import 'package:Swolly/pages/SignUp/Provider.dart';
import 'package:Swolly/pages/dashboard/DashboardUser.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Keys.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:Swolly/utils/res/Transitions.dart';

import '../signin/SignIn.dart';


class SignUp extends StatefulWidget {
  @override
  SignUpState createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  String email = "";
  String password = "";
  String fullname = "";
  String gender= "MALE";
  String role= "SUPPORTER";
  String textField1 = "Full Name";
  String textField2 = "Mail";
  String textField3 = "Password";
  String textField4 = "Gender";
  String textField5 = "Role";
  String dropdownValueGender = 'male';
  String dropdownValueRole = 'Supporter';

  GlobalKey<FormState> formKeySignUp  = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      backgroundColor: themeColor,
      //backgroundColor: Color(0xffdedede),
      body: Builder(
        builder: (context) => Form(
          key: formKeySignUp,
          child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:  SafeArea(
                  child: Column( children: [
                    Row(children: [
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24, ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Expanded(
                        child: Text("CREATE AN ACCOUNT", textAlign: TextAlign.center, style: loginH2,),
                      ),
                      Container(width: 24,),
                    ],),
                    Container(height: 12,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            textField1,
                            style: loginH2,
                            textAlign: TextAlign.left,
                          )),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your Fullname';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff848A9C), width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff848A9C), width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.green, width: 2)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.red, width: 2)),
                        labelStyle: loginH2,
                      ),
                      style: loginH1,
                      onSaved: (value) {
                        fullname = value;
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
                          )),
                    ),
                    TextFormField(
                      obscureText: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your Mail';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff848A9C), width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff848A9C), width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.green, width: 2)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.red, width: 2)),
                        labelStyle: loginH2,
                      ),
                      style: loginH1,
                      onSaved: (value) {
                        email = value;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.only(top: 16, bottom: 8),
                          child: Text(
                            textField3,
                            style: loginH2,
                            textAlign: TextAlign.left,
                          )),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your Password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff848A9C), width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff848A9C), width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.green, width: 2)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.red, width: 2)),
                        labelStyle: loginH2,
                      ),
                      style: loginH1,
                      onSaved: (value) {
                        password = value;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.only(top: 16, bottom: 8),
                          child: Text(
                            textField4,
                            style: loginH2,
                            textAlign: TextAlign.left,
                          )),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              itemHeight: null,
                              isExpanded: true,
                              dropdownColor: Color(0xff00AA4F),
                              value: dropdownValueGender,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 32,
                              elevation: 100,
                              style: TextStyle(color: Colors.white),
                              underline: Container(
                                height: 2,
                                color: Colors.white,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValueGender = newValue;
                                  switch (newValue) {
                                    case 'male':
                                      gender= "MALE";
                                      break;
                                    case 'female':
                                      gender= "FEMALE";
                                      break;
                                    case 'diverse':
                                      gender= "NONE";
                                      break;
                                  }
                                });
                              },
                              items: <String>[
                                'male',
                                'female',
                                'diverse'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            ))),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.only(top: 16, bottom: 8),
                          child: Text(
                            textField5,
                            style: loginH2,
                            textAlign: TextAlign.left,
                          )),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              itemHeight: null,
                              isExpanded: true,
                              dropdownColor: Color(0xff00AA4F),
                              value: dropdownValueRole,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 32,
                              elevation: 100,
                              style: TextStyle(color: Colors.white),
                              underline: Container(
                                height: 2,
                                color: Colors.white,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValueRole = newValue;
                                  switch (newValue) {
                                    case 'Supporter':
                                      role= "SUPPORTER";
                                      break;
                                    case 'Initiator':
                                      role= "INITIATOR";
                                      break;
                                  }
                                });
                              },
                              items: <String>[
                                'Supporter',
                                'Initiator'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            ))),
                    Expanded(
                      child: SizedBox(),
                    ),
                    //Container(height: 64,),
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(bottom: 8),
                      child: ButtonTheme(
                        height: 64,
                        minWidth: double.infinity,
                        child: FlatButton(
                          color: Color(0xff00AA4F),
                          textColor: Colors.black,
                          onPressed: (){
                            if (formKeySignUp.currentState.validate()) {
                              formKeySignUp.currentState.save();
                              SignUpProvider.signUpProvider(email, password, fullname, gender, role).then((value){
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
                          child: Text("DONE",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  letterSpacing: 0.5)),
                        ),
                      ),
                    ),
                  ]),
                ),
              )
          ),
        ),
      )
    );
  }
}