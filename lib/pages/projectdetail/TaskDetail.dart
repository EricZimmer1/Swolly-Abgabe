import 'package:Swolly/pages/projectdetail/ApplicationProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:transparent_image/transparent_image.dart';

class TaskDetail extends StatefulWidget {

  @required
  final String title, description, supportersNeeded, supportersNow, status, id;

  const TaskDetail({Key key, this.title, this.description, this. supportersNeeded, this.supportersNow, this.status, this.id}) : super(key: key);

   @override
   _TaskDetailState createState() => _TaskDetailState();

}

class _TaskDetailState extends State<TaskDetail>{

  String supporterDescription;

  GlobalKey<FormState> formKeyTaskDetail = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) =>
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 76,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  centerTitle: true,
                  backgroundColor: Color(0xff00AA4F),
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
                    margin: EdgeInsets.only(top: 16, left: 24, right: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black87
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(
                            widget.description,
                            style: projectDetailText,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.emoji_people_rounded,
                              color: Colors.green,
                              size: 40,
                            ),
                            Text(
                              widget.supportersNow + " / "+ widget.supportersNeeded + " Supporters",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Container(
                              child: Text(
                                "Want to help?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.black87
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          child: Text(
                            "That's great! Tell the project initiator here how you can help completing this task:",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Form(
                            key: formKeyTaskDetail,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter a text!';
                                    }
                                    return null;
                                  },
                                  maxLines: 10,
                                  decoration: standardDeco,
                                  onSaved: (value) {
                                    value = value.trimRight();
                                    supporterDescription = value;
                                  },
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                ButtonTheme(
                                  height: 64,
                                  minWidth: double.infinity,
                                  child: FlatButton(
                                    color: Color(0xff00AA4F),
                                    textColor: Colors.black,
                                    onPressed: (){
                                      if (formKeyTaskDetail.currentState.validate()){
                                        formKeyTaskDetail.currentState.save();
                                        ApplicationProvider.applicationSendProvider(supporterDescription, widget.id, sessionId).then((value) {
                                          if (value == 200){
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(content: Text("Your Application has been send successfully")));
                                            Navigator.pop(context);
                                          }else{
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(content: Text(value.toString())));
                                          }
                                        });
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text("Send to initiator",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            letterSpacing: 0.5)
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }

}