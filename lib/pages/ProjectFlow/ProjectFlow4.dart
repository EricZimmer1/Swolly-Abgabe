import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_villains/villain.dart';
import 'package:Swolly/pages/ProjectFlow/ProjectFlow2.dart';
import 'package:Swolly/pages/ProjectFlow/CustomAlertDialog.dart';
import 'package:Swolly/pages/ProjectFlow/ProjectFlow5.dart';
import 'package:Swolly/pages/SignUp/Provider.dart';
import 'package:Swolly/pages/dashboard/DashboardUser.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Keys.dart';
import 'package:Swolly/utils/res/ProjectTask.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:Swolly/utils/res/Transitions.dart';
import 'package:Swolly/pages/ProjectFlow/ImageProvider.dart' as ip;

class ProjectFlow4 extends StatefulWidget {
  @override
  ProjectFlow4State createState() {
    return ProjectFlow4State();
  }
}


class ProjectFlow4State extends State<ProjectFlow4> {
   GlobalKey<FormState> taskKey = GlobalKey<FormState>();

   validateAndSave() {
     if (taskKey.currentState.validate()) {
       taskKey.currentState.save();
     }
   }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: themeColor,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: taskKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 172,
                          padding: EdgeInsets.only(top: 0, left: 8, right: 0),
                          //margin: EdgeInsets.symmetric(vertical: 18,horizontal: 16),
                          decoration: BoxDecoration(
                              color: Color(0xff00AA4F)
                            //image: DecorationImage(image: AssetImage(dashboardImage),fit: BoxFit.fill)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 0),
                                child: IconButton(
                                  onPressed: () {
                                    validateAndSave();
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 12, top: 4),
                                child: Text(
                                  "Add Tasks",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      letterSpacing: 2),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 12, top: 8),
                                child: Text(
                                  "Please add Tasks to your Projects. Those will be displayed on your Project page. Swipe left on Tasks to delete them.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      letterSpacing: 1
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),

                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height-20,
                      child: ListView.builder(
                          itemCount: taskObjectList.length,
                          itemBuilder: (BuildContext context, int index){
                            if (taskObjectList[index].title=="ADD_INITIAL_LIST") {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                height: 48,
                                margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        width: 2,
                                        color: unselectedTextColor
                                    )
                                ),
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      taskObjectList.insert(taskObjectList.length-1, ProjectTask.userTaskIni());
                                      //taskObjectList.insert(0, ProjectTask.userTaskIni());
                                    });
                                  },
                                  child: Icon(
                                      Icons.add
                                  ),
                                ),
                              );
                            }
                            return  Dismissible(
                              direction: DismissDirection.endToStart,
                              background: Container(
                                color: Colors.red,
                                child: Icon(Icons.delete,textDirection: TextDirection.rtl,),
                              ),
                              key: Key(taskObjectList[index].title),
                              // ignore: missing_return
                              confirmDismiss: (DismissDirection direction)async{
                                await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomAlertDialog();
                                  },
                                ).then((val){
                                  if(val == true){
                                    print(taskObjectList.length);
                                    print(taskObjectList[index].getTitle());
                                    print(taskObjectList[index].getDescription());
                                    print(taskObjectList[0].getTitle());
                                    print(taskObjectList[0].getDescription());
                                    print(index);
                                    taskObjectList.removeAt(index);
                                    setState(() {});
                                  }
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 400,
                                margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2, color: unselectedTextColor),
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 12, left: 12, right: 12),
                                      child: Text(
                                        "New Task",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            letterSpacing: 1),
                                      )
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 12, left: 12, right: 12),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please provide a name for this Task';
                                          }
                                          return null;
                                        },
                                        initialValue: taskObjectList[index].getTitle(),
                                        decoration: InputDecoration(
                                          hintText: "How would you call this task?",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: unselectedTextColor),
                                          ),
                                        ),
                                        onChanged: (value){
                                          taskObjectList[index].setTitle(value);
                                          print(taskObjectList[index].getTitle());
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 12, left: 12, right: 12),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please a description for this task';
                                          }
                                          return null;
                                        },
                                        initialValue: taskObjectList[index].getDescription(),
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          hintText: "What has to be done?",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: unselectedTextColor),
                                          ),
                                        ),
                                        onChanged: (value){
                                          taskObjectList[index].setDescription(value);
                                          print(taskObjectList[index].getDescription());
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 12, left: 12, right: 12),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please provide the number of people needed';
                                          }
                                          return null;
                                        },
                                        initialValue: taskObjectList[index].getSupportersNeeded(),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: "How many people do you need?",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: unselectedTextColor),
                                          ),
                                        ),
                                        onChanged: (value){
                                          taskObjectList[index].setSupportersNeeded(value);
                                          print(taskObjectList[index].getSupportersNeeded());
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: ButtonTheme(
                        height: 64,
                        minWidth: double.infinity,
                        child: FlatButton(
                          color: Color(0xff00AA4F),
                          textColor: Colors.black,
                          onPressed: (){
                            if (taskKey.currentState.validate()) {
                              validateAndSave();
                              createProject.setTasks(taskObjectList);
                              print(createProject.getTasks());
                              Navigator.of(context).push(
                                  FadeRouteBuilder(page: ProjectFlow5()));
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
