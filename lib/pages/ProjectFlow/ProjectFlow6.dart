import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Swolly/pages/dashboard/DashboardInitiator.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Keys.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:Swolly/utils/res/Transitions.dart';

class ProjectFlow6 extends StatefulWidget {
  @override
  ProjectFlow6State createState() {
    return ProjectFlow6State();
  }
}

class ProjectFlow6State extends State<ProjectFlow6> {

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
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 172,
                        padding: EdgeInsets.only(top: 0, left: 8, right: 0),
                        //margin: EdgeInsets.symmetric(vertical: 18,horizontal: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                            color: Color(0xff00AA4F)
                          //image: DecorationImage(image: AssetImage(dashboardImage),fit: BoxFit.fill)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 0),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(FadeRouteBuilder(page: DashboardInitiator()));
                                },
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 12, top: 4),
                              child: Text(
                                "Create a Project",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    letterSpacing: 2),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 12, top: 8),
                              child: Text(
                                "You're done!",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    letterSpacing: 1
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              width: 24,
                            ),
                          ],
                        ))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  height: 128,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/assets/images/Logo-Final-No-Text.png"),
                          alignment: Alignment.center
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 24, left: 12, right: 16),
                  child: Text(
                    "Your Project has been created successfully!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff00AA4F)
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 32, left: 16, right: 12),
                      child: Text(
                        "Thank you for sharing your Project with our Community! Every Project counts!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24,
                            color: Color(0xff00AA4F)
                        ),
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: ButtonTheme(
                      height: 64,
                      minWidth: double.infinity,
                      child: FlatButton(
                        color: Color(0xff00AA4F),
                        textColor: Colors.black,
                        onPressed: () {
                          Navigator.of(context)
                              .push(FadeRouteBuilder(page: DashboardInitiator()));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text("Back to Dashboard",
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
    );
  }
}
