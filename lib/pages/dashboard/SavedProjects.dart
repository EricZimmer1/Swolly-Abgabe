import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Swolly/pages/dashboard/DashboardUser.dart';
import 'package:Swolly/pages/dashboard/cardViewDashboard.dart';
import 'package:Swolly/utils/customScrollBehavior.dart';
import 'package:Swolly/utils/res/Transitions.dart';
import 'package:Swolly/utils/res/colors.dart';


class SavedProjects extends StatefulWidget {
  @required
  final error;

  const SavedProjects({Key key, this.error}) : super(key: key);
  @override
  _SavedProjectsState createState() => _SavedProjectsState();
}

class _SavedProjectsState extends State<SavedProjects> {


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: Container(
            color: secondaryColor,
            child: SafeArea(
              child: Material(
                color: Color(0xffdedede),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 88,
                      padding: EdgeInsets.only(top: 24, left: 8, right: 8),
                      color: Color(0xffdedede),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: IconButton(
                                  onPressed: (){
                                    Navigator.of(context).push(FadeRouteBuilder(page: DashboardUser()));
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size:32,
                                  ),
                                ),
                                ),
                              Expanded(
                                child: Text(
                                  "Saved Projects",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32,
                                      letterSpacing: 2
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right:16),
                                  width: 24,
                                  ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: CardViewDashboard()
                        )
                  ],
                ),
              ),
            )
        )
    );
  }
}