import 'package:Swolly/pages/dashboard/MyProjectList.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Swolly/pages/ProjectFlow/ProjectFlow0.dart';
import 'package:Swolly/pages/dashboard/cardViewDashboardInit.dart';
import 'package:Swolly/utils/customScrollBehavior.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Transitions.dart';
import 'package:Swolly/utils/res/colors.dart';


class DashboardInitiator extends StatefulWidget {
  @required
  final error;

  const DashboardInitiator({Key key, this.error}) : super(key: key);
  @override
  _DashboardInitiatorState createState() => _DashboardInitiatorState();
}

class _DashboardInitiatorState extends State<DashboardInitiator> {

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
                color: themeColor,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 76,
                      padding: EdgeInsets.only(top: 12, left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: Color(0xff00AA4F),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 12),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                        image: AssetImage(
                                            "lib/assets/images/Logo-White-Trans.png"
                                        ),
                                        alignment: Alignment.center,
                                    )
                                ),
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  "My Projects",
                                  minFontSize: 22,
                                  maxFontSize: 32,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right:16, bottom: 8),
                                  child: IconButton(
                                    onPressed: (){
                                      Navigator.of(context).push(FadeRouteBuilder(page: ProjectFlow0()));
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                        child: FutureBuilder(
                          future: projectProvider(),
                          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                            if (snapshot.connectionState == ConnectionState.done){
                              if (projectInitiatorList.length == 0) {
                                return Container(
                                  padding: EdgeInsets.only(left: 40, right: 40, top: 200),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Welcome to Swolly!",
                                          style: projectDetailH1,
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "\nIt seems like you don't have any projects yet.\n\nClick the plus icon in the top right corner and start creating a new one!",
                                          style: projectDetailH3Normal,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )
                                  ),
                                );
                              }
                              return MyProjectList(projectList: projectInitiatorList);
                              //return CardViewDashboardInit(projectList: projectList);
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
                                    "Couldn't connect to the Server!\nPlease check your Internet connection!",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
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
              ),
            )
        )
    );
  }
}