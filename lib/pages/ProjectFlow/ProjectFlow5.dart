import 'dart:ffi';

import 'package:Swolly/pages/ProjectFlow/ProjectFlowSummary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_villains/villain.dart';
import 'package:Swolly/pages/ProjectFlow/ProjectFlow2.dart';
import 'package:Swolly/pages/ProjectFlow/ProjectFlow6.dart';
import 'package:Swolly/pages/ProjectFlow/ProjectFlowProvider.dart';
import 'package:Swolly/pages/SignUp/Provider.dart';
import 'package:Swolly/pages/dashboard/DashboardInitiator.dart';
import 'package:Swolly/pages/dashboard/DashboardUser.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Keys.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:Swolly/utils/res/Transitions.dart';


class ProjectFlow5 extends StatefulWidget {
  @override
  ProjectFlow5State createState() {
    return ProjectFlow5State();
  }
}

class ProjectFlow5State extends State<ProjectFlow5> {

  double moneyGoal;
  String textField1 = "Money goal";

  GlobalKey<FormState> formKeyProjectFlow5  = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: formKeyProjectFlow5,
              child: Column(
                children: [
                  Row(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 172,
                      padding: EdgeInsets.only(top: 0, left: 8, right: 0),
                      //margin: EdgeInsets.symmetric(vertical: 18,horizontal: 16),
                      decoration: BoxDecoration(
                        color: Color(0xff00AA4F),
                        //image: DecorationImage(image: AssetImage(dashboardImage),fit: BoxFit.fill)
                      ),
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 0),
                            child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size:32,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left:12, top: 4),
                            child: Text(
                              "Money Goal",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  letterSpacing: 2
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 12, top: 8),
                            child: Text(
                              "Please provide the amount of money needed for your Project",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  letterSpacing: 1
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right:16),
                            width: 24,
                          ),
                        ],
                      ),
                    ),
                  ],),

                  Container(
                      margin: EdgeInsets.only(top:28 ,bottom: 4, left:12,right: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Text(
                              textField1,
                              style: loginH2,
                              textAlign: TextAlign.left,
                            )),
                      )),
                  Container(
                    margin: EdgeInsets.only(top:8 ,bottom: 4, left:12,right: 12),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: createProject.getMoneyGoal().toString(),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a valid amount of money';
                        }
                        return null;
                      },
                      decoration: standardDeco,
                      style: loginH1,
                      onSaved: (value) {
                        value.replaceAll(",", ".");
                        value.trim();
                        RegExp validMoneyAmount = new RegExp(r"([1-9][0-9]*)([.]?)([0-9]?[0-9]?)");
                        final match = validMoneyAmount.firstMatch(value);
                        String preDecimalPlaces = match.group(1);
                        String decimalPoint = match.group(2);
                        String decimalPlaces= match.group(3);
                        if (decimalPlaces.length == 0){
                          decimalPlaces = "00";
                        }
                        if (decimalPlaces.length == 1){
                          decimalPlaces = decimalPlaces + "0";
                        }
                        if (decimalPoint.length == 0) {
                          decimalPoint = ".";
                        }
                        String moneyString = preDecimalPlaces + decimalPoint + decimalPlaces;
                        print(moneyString);
                        moneyGoal = double.parse(moneyString);
                      },
                    ),
                  ),


                  Expanded(child: Container(),),

                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 8),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: ButtonTheme(
                        height: 64,
                        minWidth: double.infinity,
                        child: FlatButton(
                          color: Color(0xff00AA4F),
                          textColor: Colors.black,
                          onPressed: (){
                            if (formKeyProjectFlow5.currentState.validate()) {
                              formKeyProjectFlow5.currentState.save();
                              createProject.setMoneyGoal(moneyGoal);
                              Navigator.of(context).push(FadeRouteBuilder(page: ProjectFlowSummary()));
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text("NEXT",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  letterSpacing: 0.5)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),);
  }
}

