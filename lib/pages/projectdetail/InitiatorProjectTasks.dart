import 'package:Swolly/pages/projectdetail/TaskApplicationListItem.dart';
import 'package:Swolly/utils/res/Applicant.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Project.dart';
import 'package:Swolly/utils/res/ProjectTask.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InitiatorProjectTasks extends StatefulWidget {
  @required
  final Project project;

  const InitiatorProjectTasks({this.project});

  @override
  _InitiatorProjectTasksState createState() => _InitiatorProjectTasksState();

}

class _InitiatorProjectTasksState extends State<InitiatorProjectTasks> {

  Applicant applicant = Applicant.applicantIni("Herbert Grönemeyer", "","herbi.gröni@yahoo.de", "This is a test text for testing the field, where a applicant can send a long description of his beast things.", false);
  ProjectTask task = ProjectTask.userTask("Paint Walls", "We need someone to paint walls", "15");

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
    return FutureBuilder(
      future: applicationsInitiatorProvider(widget.project),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
        if (snapshot.connectionState == ConnectionState.done){
          if (widget.project.applications.length == 0){
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                      margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Applications",
                                style: projectDetailH1,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          )
                        ],
                      )
                  ),
                ),
                SliverFillRemaining(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: Text(
                        "You currently don't have applications for this project!",
                        style: projectDetailText,
                      ),
                    ),
                  ),
                )
              ],
            );
          }
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                    margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Applications",
                              style: projectDetailH1,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        )
                      ],
                    )
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                        (context, index) => TaskApplicationListItem(
                      applicant: widget.project.getApplications()[index],
                      project: widget.project,
                    ),
                    childCount: widget.project.getApplications().length
                ),
              )
            ],
          );
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
      }
    );
  }
}