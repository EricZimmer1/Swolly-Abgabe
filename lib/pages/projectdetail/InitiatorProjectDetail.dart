import 'package:Swolly/pages/dashboard/DashboardInitiator.dart';
import 'package:Swolly/pages/dashboard/InititatorProjectInfo.dart';
import 'package:Swolly/pages/projectdetail/InitiatorProjectTasks.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Project.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:Swolly/utils/res/Transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InitiatorProjectDetail extends StatefulWidget {
  @required
  final Project project;

  const InitiatorProjectDetail({this.project});

  @override
  _InitiatorProjectDetailState createState() => _InitiatorProjectDetailState();
}

class _InitiatorProjectDetailState extends State<InitiatorProjectDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                actionsIconTheme: IconThemeData(opacity: 0.0),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    serverUrlImages+widget.project.getImage(),
                    fit: BoxFit.cover,
                  ),
                ),
                backgroundColor: themeGreen,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: (){
                    Navigator.pushReplacement(context, FadeRouteBuilder(page: DashboardInitiator(),transitionTime: 200));
                  },
                ),
                title: Text(
                  widget.project.title,
                  //widget.project.title,
                  style: projectDetailH1White,
                ),
                centerTitle: true,
                bottom: TabBar(
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 5, color: Colors.white),
                  ),
                  indicatorColor: Colors.white,
                    tabs: <Widget>[
                      Tab(
                        text: "Project Overview",
                        icon: Icon(
                          Icons.info_outline,
                          size: 28,
                        ),
                      ),
                      Tab(
                        text: "Task Applications",
                        icon: Icon(
                          Icons.check_box_outlined,
                          size: 28,
                        ),
                      )
                    ]
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              InitiatorProjectInfo(project: widget.project),
              InitiatorProjectTasks(project: widget.project)
            ],
          ),
        ),
      ),
    );
  }
}