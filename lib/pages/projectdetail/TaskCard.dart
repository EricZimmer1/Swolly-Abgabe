import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Swolly/pages/projectdetail/TaskDetail.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Transitions.dart';

class TaskCard extends StatelessWidget {

  @required
  final String title, description, status, id;
  final int supportersNeeded, supportersNow;

  const TaskCard({Key key, this.title, this.description, this.supportersNeeded, this.supportersNow, this.status, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:24, right: 24, top:12),
      child: Column(
        children: <Widget>[
          Divider(
            color: themeColor,
            height: 12,
          ),
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
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black87
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            child: Text(
              description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87
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
                supportersNow.toString() + " / "+ supportersNeeded.toString() + " Supporters",
              ),
              Expanded(
                  child: SizedBox(),
              ),
              Container(
                //margin: EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
                child: ButtonTheme(
                  minWidth: 150,
                  height: 40,
                  child: FlatButton(
                    color: Colors.green,
                    //color: Color(0xff00AA4F),
                    onPressed: (){
                      Navigator.of(context).push(FadeRouteBuilder(page: TaskDetail(
                        title: title,
                        description: description,
                        supportersNeeded: supportersNeeded.toString(),
                        supportersNow: supportersNow.toString(),
                        status: status,
                        id: id,
                      )));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Learn more",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        letterSpacing: 0.5
                      )
                    )
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}