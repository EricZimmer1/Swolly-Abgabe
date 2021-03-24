import 'package:Swolly/pages/projectdetail/InitiatorProjectDetail.dart';
import 'package:Swolly/pages/projectdetail/InitiatorProjectTasks.dart';
import 'package:Swolly/utils/res/Applicant.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Project.dart';
import 'package:Swolly/utils/res/ProjectTask.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:Swolly/utils/res/Transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ApplicationProvider.dart';

class TaskApplicationDetail extends StatelessWidget {
  @required
  final Applicant applicant;
  final Project project;

  const TaskApplicationDetail({this.applicant, this.project});

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
                      Navigator.pushReplacement(context, FadeRouteBuilder(page: InitiatorProjectDetail(project: project,)));
                      //Navigator.pop(context);
                    },
                  ),
                  centerTitle: true,
                  backgroundColor: themeGreen,
                  title: Text(
                      "Application Details",
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
                        Container(
                          width: double.infinity,
                          child: Text(
                            applicant.getName(),
                            style: projectDetailH2,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(
                            "applied for: "+applicant.getCorrespondingTaskName(),
                            style: projectDetailTextItalic,
                          )
                        ),
                        Container(
                          width: double.infinity,
                            margin: EdgeInsets.only(top: 12),
                            child: Text(
                              applicant.getExpose(),
                              style: projectDetailText,
                            )
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 12),
                          child: Text(
                            "E-Mail",
                            style: projectDetailH3,
                          )
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            applicant.getEmail(),
                            style: projectDetailText,
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          width: double.infinity,
                          child: Text(
                            applicant.getCorrespondingTaskName() + " Description",
                            style: projectDetailH3,
                            textAlign: TextAlign.left,
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          width: double.infinity,
                          child: Text(
                            applicant.getCorrespondingTaskDescription(),
                            style: projectDetailText,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          width: double.infinity,
                          child: Text(
                            "Current Supporters",
                            style: projectDetailH3,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 12),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.emoji_people_rounded,
                                  size: 32,
                                  color: themeGreen,
                                ),
                                Text(
                                  "   "+ applicant.getCorrespondingSupporterCount() +" / "+ applicant.getCorrespondingSupporterGoal() +" needed supporters",
                                  style: projectDetailText,
                                )
                              ],
                            )
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: ButtonTheme(
                                  height: 64,
                                  minWidth: double.infinity,
                                  child: FlatButton(
                                    color: Colors.red,
                                    textColor: Colors.black,
                                    onPressed: () {
                                      ApplicationProvider.applicationDelete(applicant.getId(), sessionId).then((value) {
                                        if (value == 200){
                                          Scaffold.of(context)
                                              .showSnackBar(SnackBar(content: Text("Application has been declined")));
                                          Navigator.pushReplacement(context, FadeRouteBuilder(page: InitiatorProjectDetail(project: project,)));
                                        }else{
                                          Scaffold.of(context)
                                              .showSnackBar(SnackBar(content: Text(value.toString())));
                                        }
                                      });
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text("Decline",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            letterSpacing: 0.5)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: ButtonTheme(
                                  height: 64,
                                  minWidth: double.infinity,
                                  child: FlatButton(
                                    color: Color(0xff00AA4F),
                                    textColor: Colors.black,
                                    onPressed: () {
                                      ApplicationProvider.applicationStatusUpdate(applicant.getId(), true, sessionId).then((value) {
                                        if (value == 200){
                                          Scaffold.of(context)
                                              .showSnackBar(SnackBar(content: Text("Application has been accepted")));
                                          Navigator.pushReplacement(context, FadeRouteBuilder(page: InitiatorProjectDetail(project: project,)));
                                        }else{
                                          Scaffold.of(context)
                                              .showSnackBar(SnackBar(content: Text(value.toString())));
                                        }
                                      });
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text("Accept",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            letterSpacing: 0.5)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
      )
    );
  }

}