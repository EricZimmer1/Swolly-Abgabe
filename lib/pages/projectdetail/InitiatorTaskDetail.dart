import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/ProjectTask.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InitiatorTaskDetail extends StatelessWidget {

  @required
  final ProjectTask task;

  const InitiatorTaskDetail({Key key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) =>
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                      //Navigator.pop(context);
                    },
                  ),
                  centerTitle: true,
                  backgroundColor: themeGreen,
                  title: Text(
                      "Task Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                      )
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.check_box,
                              color: Colors.green,
                              size: 32,
                              semanticLabel: "Project not done",
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              child: Text(
                                task.getTitle(),
                                style: projectDetailH2,
                              ),
                            )
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 8),
                            width: double.infinity,
                            child: Text(
                              task.getDescription(),
                              style: projectDetailText,
                            )
                        ),
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 12, bottom: 12),
                            child: Text(
                              "Current supporters:",
                              style: projectDetailH2,
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 24, right: 24),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                child: Text(
                                  task.getApplications()[index].getName(),
                                  style: projectDetailH3,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 8, bottom: 8),
                                child: Text(
                                  task.getApplications()[index].getEmail(),
                                  style: projectDetailText,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    childCount: task.getApplications().length
                  ),
                )
              ],
            ),
      )
    );
  }

}