import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_villains/villain.dart';
import 'package:Swolly/pages/ProjectFlow/ProjectFlow4.dart';
import 'package:Swolly/pages/SignUp/Provider.dart';
import 'package:Swolly/pages/dashboard/DashboardUser.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Keys.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:Swolly/utils/res/Transitions.dart';
import 'package:Swolly/pages/ProjectFlow/ImageProvider.dart' as ip;

class ProjectFlow3 extends StatefulWidget {
  @override
  ProjectFlow3State createState() {
    return ProjectFlow3State();
  }
}

class ProjectFlow3State extends State<ProjectFlow3> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (createProject.getImage()==null){
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
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 12, top: 4),
                                child: Text(
                                  "Upload Photo",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      letterSpacing: 2),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 12, right: 12, top: 8),
                                child: Text(
                                  "Please upload a picture for your Project. This will be displayed on your Project site.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      letterSpacing: 1
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        ip.getImage().then((value) {
                          if (value==200){
                            Navigator.of(context).push(FadeRouteBuilder(page: ProjectFlow4())).then((value) {
                              setState(() {});
                            });
                          }
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey,
                            border: Border.all(
                              color: unselectedTextColor,
                            )),
                        child: Icon(
                          Icons.add,
                          size: 70,
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
    } else {
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
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 12, top: 4),
                                child: Text(
                                  "Upload Photo",
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
                                  "Please upload a picture for your Project. This will be displayed on your Project site.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      letterSpacing: 1
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(serverUrlImages+createProject.getImage())
                        )
                      ),
                    )
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 64,
                          //width: MediaQuery.of(context).size.width/2,
                          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                          child: ButtonTheme(
                            height: 64,
                            //minWidth: double.infinity,
                            child: FlatButton(
                              color: Colors.red,
                              textColor: Colors.black,
                              onPressed: () {
                                ip.getImage().then((value) {
                                  if (value==200){
                                    Navigator.of(context).push(FadeRouteBuilder(page: ProjectFlow4())).then((value) {
                                      setState(() {

                                      });
                                    });
                                  }
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text("Replace Photo",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      letterSpacing: 0.5)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                          height: 64,
                          //width: MediaQuery.of(context).size.width/2,
                          child: ButtonTheme(
                            height: 64,
                            //minWidth: double.infinity,
                            child: FlatButton(
                              color: Color(0xff00AA4F),
                              textColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, FadeRouteBuilder(page: ProjectFlow4(),transitionTime: 200)).then((value) {
                                  setState(() {
                                  });
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text("Keep Photo",
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
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
