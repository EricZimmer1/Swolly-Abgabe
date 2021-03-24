import 'package:Swolly/utils/res/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCardForFlow extends StatelessWidget {
  @required
  final String title, description, supportersNeeded;

  const TaskCardForFlow({Key key, this.title, this.description, this.supportersNeeded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, left: 12, right: 12),
      child: Column(
        children: <Widget>[
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
              Text(
                title,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 6),
              child: Text(
                description,
                textAlign: TextAlign.left,
                style: projectDetailText
              ),
            ),
          ),

          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Icon(
                Icons.emoji_people_rounded,
                color: Colors.green,
                size: 32,
              ),
              Text(
                "Supporters needed: " + supportersNeeded,
                style: projectDetailText,
              ),
            ],
          )
        ],
      ),
    );
  }

}