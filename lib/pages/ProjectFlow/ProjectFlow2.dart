import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_villains/villain.dart';
import 'package:Swolly/pages/SignUp/Provider.dart';
import 'package:Swolly/pages/dashboard/DashboardUser.dart';
import 'package:Swolly/pages/dashboard/cardViewDashboard.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Keys.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:Swolly/utils/res/Transitions.dart';



class ProjectFlow2 extends StatefulWidget {
  @override
  ProjectFlow2State createState() {
    return ProjectFlow2State();
  }
}

class ProjectFlow2State extends State<ProjectFlow2> {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: themeColor,
      child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 172,
                        padding: EdgeInsets.only(top: 0, left: 8, right: 0),
                        //margin: EdgeInsets.symmetric(vertical: 18,horizontal: 16),
                        decoration: BoxDecoration(
                            color: Color(0xff00AA4F)
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
                                "Choose Project Category",
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
                                "Please choose a category for your Project. This determines how people find your Project.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    letterSpacing: 1
                                ),
                              ),
                            ),
                          ],
                        )
                    )
                  ],),



                  Expanded(
                        child: CardViewDashboard(categoryList: categoryList, isProjectFlow: true,),
                  ),
                ],
              ),
            ),
          ),
    ),);
  }
}

