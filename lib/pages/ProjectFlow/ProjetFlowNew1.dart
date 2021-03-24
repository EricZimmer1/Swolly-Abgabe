import 'package:Swolly/pages/ProjectFlow/ProjectFlowAddress.dart';
import 'package:Swolly/pages/ProjectFlow/ProjectFlowHeader.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:Swolly/utils/res/Transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ProjectFlow2.dart';

class ProjectFlow1New extends StatefulWidget {
  @override
  _ProjectFlow1NewState createState() => _ProjectFlow1NewState();
}

class _ProjectFlow1NewState extends State<ProjectFlow1New> {
  String projectName, projectDescription;
  GlobalKey<FormState> formKeyProjectFlow1New  = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            floating: true,
              delegate: ProjectFlowHeader(
                "General Information", "Please provide general information about your project. These infos will be displayed on your project page.",
                minExtent: 172,
                maxExtent: 172,
              )
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 12, left: 12, right: 12),
              child: Form(
                key: formKeyProjectFlow1New,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Whats the name for your project?",
                          style: loginH2,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a name for your Project';
                        }
                        return null;
                      },
                      decoration: standardDeco,
                      style: loginH1,
                      onSaved: (value) {
                        projectName = value;
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          "Please describe your project for other users:",
                          style: loginH2,
                        )
                      ],
                    ),SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      maxLines: 8,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a description for your Project';
                        }
                        return null;
                      },
                      decoration: standardDeco,
                      style: loginH1,
                      onSaved: (value) {
                        value = value.trimRight();
                        projectDescription = value;
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      child: ButtonTheme(
                        height: 64,
                        minWidth: double.infinity,
                        child: FlatButton(
                          color: Color(0xff00AA4F),
                          textColor: Colors.black,
                          onPressed: (){
                            if (formKeyProjectFlow1New.currentState.validate()) {
                              formKeyProjectFlow1New.currentState.save();
                              createProject.setTitle(projectName);
                              createProject.setDescription(projectDescription);
                              Navigator.of(context).push(FadeRouteBuilder(page: ProjectFlowAddress()));
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text("NEXT",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  letterSpacing: 0.5)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}