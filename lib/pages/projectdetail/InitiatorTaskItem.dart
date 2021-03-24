import 'package:Swolly/pages/projectdetail/InitiatorTaskDetail.dart';
import 'package:Swolly/utils/res/ProjectTask.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:Swolly/utils/res/Transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InitiatorTaskItem extends StatelessWidget {

  @required
  final ProjectTask task;

  const InitiatorTaskItem({Key key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, FadeRouteBuilder(page: InitiatorTaskDetail(task: task,)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                task.getTitle(),
                style: projectDetailH3,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                task.getDescription(),
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
                  "currently "+ task.getSupportersNow() +" / "+ task.getSupportersNeeded() +" needed supporters",
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