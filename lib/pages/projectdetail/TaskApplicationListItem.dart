import 'package:Swolly/pages/projectdetail/TaskApplicationDetail.dart';
import 'package:Swolly/utils/res/Applicant.dart';
import 'package:Swolly/utils/res/Project.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:Swolly/utils/res/Transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskApplicationListItem extends StatefulWidget{
  @required
  final Applicant applicant;
  final Project project;

  const TaskApplicationListItem({this.applicant, this.project});

  _TaskApplicationListItemState createState() => _TaskApplicationListItemState();

}

class _TaskApplicationListItemState extends State<TaskApplicationListItem> {

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
    return InkWell(
      onTap: () {
        Navigator.push(context, FadeRouteBuilder(page: TaskApplicationDetail(
          applicant: widget.applicant,
          project: widget.project,
        ))).then((value) => setState(() {}));
      },
      child: Container(
        margin: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.applicant.getName(),
                  style: projectDetailH3,
                )
              ],
            ),
            Container(
              width: double.infinity,
              child: Text(
                "applied for: "+widget.applicant.getCorrespondingTaskName(),
                style: projectDetailTextItalic,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                widget.applicant.getExpose(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: projectDetailText,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.emoji_people_rounded,
                  color: Colors.green,
                  size: 32,
                ),
                Text(
                  "currently "+ widget.applicant.getCorrespondingSupporterCount() +" / "+ widget.applicant.getCorrespondingSupporterGoal() +" needed supporters",
                ),
              ],
            ),
            Divider(
              thickness: 2,
            )
          ],
        ),
      ),
    );
  }

}