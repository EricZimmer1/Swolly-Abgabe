import 'package:Swolly/pages/ProjectFlow/ProjectFlowAddress.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Swolly/pages/dashboard/cardViewDashboard.dart';
import 'package:Swolly/utils/customScrollBehavior.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Transitions.dart';



class DashboardUser extends StatefulWidget {
  @required
  final error;

  const DashboardUser({Key key, this.error}) : super(key: key);
  @override
  _DashboardUserState createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  bool imageVisibility;

  @override
  void initState() {
    super.initState();
  }

  void _setImageVisibility(){
    if(widget.error!=null){
      imageVisibility = true;
    }else{
      imageVisibility = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    _setImageVisibility();
    return ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: Material(
          color: themeColor,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  height: 76,
                  padding: EdgeInsets.only(top: 12, left: 8, right: 8),
                  color: themeGreen,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 12),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage("lib/assets/images/Logo-White-Trans.png"),alignment: Alignment.center)
                            ),
                          ),
                          Expanded(
                            child: AutoSizeText(
                              "Categories",
                              minFontSize: 32,
                              maxFontSize: 32,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(right:16, bottom: 2),
                              child: IconButton(
                                //TODO add on pressed to saved
                                onPressed: (){

                                },
                                icon: Icon(
                                  Icons.bookmark_border,
                                  color: themeGreen,
                                  size: 32,
                                ),
                              )
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 16, left: 20, right: 20),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        width: double.infinity,
                        child: Text(
                          "Explore Swolly",
                          style: projectDetailH3,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text(
                          "Pick a category to explore all the amazing projects created by our community and find one you like to support!",
                          style: projectDetailText,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: FutureBuilder(
                      future: categoryProvider(),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                        if (snapshot.connectionState == ConnectionState.done) {
                          return CardViewDashboard(categoryList: categoryList,isProjectFlow: false,);
                        }
                        if (snapshot.connectionState == ConnectionState.waiting){
                          return Center(
                            heightFactor: 1,
                            widthFactor: 1,
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: CircularProgressIndicator(
                              ),
                            ),
                          );
                        }
                        return Container(
                          padding: EdgeInsets.only(top: 250),
                          child: Column(
                            children: [
                              Text(
                                "An Error occurred",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    letterSpacing: 2
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              ButtonTheme(
                                  height: 52,
                                  minWidth: 150,
                                  child: FlatButton(
                                    color: Color(0xff00AA4F),
                                    textColor: Colors.black,
                                    onPressed: () => setState(() {}),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text("Retry",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            letterSpacing: 0.5)),
                                  )
                              )
                            ],
                          ),
                        );
                      },
                    )
                )
              ],
            ),
          )
        ),
    );
  }
}