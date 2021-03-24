import 'package:Swolly/pages/projectdetail/InitiatorProjectDetail.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Project.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:Swolly/utils/res/Transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProjectList extends StatefulWidget{
  @required
  final projectList;

  const MyProjectList({this.projectList});

  @override
  _MyProjectListState createState() => _MyProjectListState();
}

class _MyProjectListState extends State<MyProjectList> {

  Project project = new Project();

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
    return ListView.builder(
      itemCount: widget.projectList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(top: 16, left: 16, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 4.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
              )
            ],
          ),
          child: InkWell(
            onTap: () => {
              Navigator.of(context).push(FadeRouteBuilder(page: InitiatorProjectDetail(project: projectInitiatorList[index]),transitionTime: 200)),
            },
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                      image: DecorationImage(image: NetworkImage(serverUrlImages+widget.projectList[index].getImage()),fit: BoxFit.fill)
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Visibility(
                  visible: ((){
                    if (widget.projectList[index].getStatus() == "NEEDS_VERIFICATION"){
                      return true;
                    } else {
                      return false;
                    }
                  }()),
                  child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        children: [
                          Icon(
                            Icons.warning_rounded,
                            color: Colors.red,
                            size: 24,
                          ),
                          Text(
                            "Project not verified!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    widget.projectList[index].getTitle(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black87
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    "last updated on "+widget.projectList[index].getCreated(),
                    style: projectDetailTextItalic,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 12, left: 16, right: 16),
                    width: double.infinity,
                    child: Text(
                      widget.projectList[index].getDescription(),
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87
                      ),
                    )
                ),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          )
        );
      }
    );
  }

}