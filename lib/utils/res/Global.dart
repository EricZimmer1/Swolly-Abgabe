import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:Swolly/utils/res/Applicant.dart';
import 'package:Swolly/utils/res/Project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:Swolly/utils/res/CategoryModel.dart';
import 'package:Swolly/utils/res/ProjectModel.dart';
import 'package:Swolly/utils/res/ProjectTask.dart';

import 'ProjectCategoryModel.dart';


/// DO NOT CHANGE
/// FOR DEBUGGING PURPOSE ONLY
// ignore: non_constant_identifier_names
bool DEBUG;
/// End

String buildVersion = "0.0.1+1";
bool valFirstStart,valNotification,valDarkMode,valFingerprint;
String valLanguage,valProfilePicture,heroTagOnBoard;
String sessionId = "";
String userRole;
String serverUrl = "https://php.jonas-langlotz.de";
String serverUrlTest = "https://dev.jonas-langlotz.de/graphql";
String serverUrlImages = "https://dev.jonas-langlotz.de/";
bool establishedConnection = true;

Project createProject = new Project();

List taskList = ["Add"];
List<ProjectTask> taskObjectList = new List();
List<Project> projectUserList = new List();
List<Project> projectInitiatorList = new List();
List projectAdd = [];

List<CategoryModel> categoryList;
List<ProjectModel> projectList;
List<ProjectCategoryModel> projectListCategory;

initFirstSetup(){
  setValueSharedPref("notification", false,"bool");
  setValueSharedPref("darkmode", false,"bool");
  setValueSharedPref("fingerprint", false,"bool");
  setValueSharedPref("language","English","string");
}

// KEYS
// firstStart | notification | darkmode | fingerprint | abode | language | name | nickname | ip | privacy
setValueSharedPref(key, value, type)async{
  DEBUG ?? print("INFO:: save value to shared preference");
  SharedPreferences sharedPref = await SharedPreferences.getInstance();

  if (type == "string"){
    await sharedPref.setString(key, value);
  }
  else{
    await sharedPref.setBool(key, value);
  }
}

getSettings(key, type)async{
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  if (type == "string"){
    return sharedPref.getString(key);
  }
  else{
    return sharedPref.getBool(key);
  }
}

loadSharedPreferences()async{
  DEBUG ?? print("INFO:: load shared preferences");
  valFirstStart = await getSettings("firstStart", "bool");
  valNotification = await getSettings("notification", "bool");
  valDarkMode = await getSettings("darkmode", "bool");
  valFingerprint = await getSettings("fingerprint", "bool");

  valLanguage = await getSettings("language", "string");
  valProfilePicture = await getSettings("profilePicture", "string");
  taskObjectList.add(new ProjectTask.iniAdd());
}

projectProviderCategory(String categoryId) async {
  print(categoryId);
  var url = serverUrlTest;
  var query = '''
    query {
      projects(filter: {
        categoryId: "$categoryId"
      }, location: {
        lat: 4
        lon: 20
      }) {
        success
        code
        message
        projects {
          id
          title
          description
          moneyGoal
          updatedAt
          lat
          lon
          images {
            file
          }
          tasks {
            id
            title
            description
            supporterGoal
            supporterCount
          }
        }
      }
    }''';

  var data = {"operationName": null, "variables": {}, "query": query};
  var response = await http.post(url, headers: {
    'content-type': 'application/json',
    'Authorization': sessionId
  }, body: json.encode(data));
  Map<String, dynamic> success;

  success = json.decode(response.body);
  print(success);

  if (success['errors'] == null) {
    if (success['data']['projects']['success']) {
      List dataList = success['data']['projects']['projects'] as List;
      projectListCategory = (dataList)
          .map((data) => ProjectCategoryModel.fromJson(data))
          .toList();
    } else {
      print(success['data']['user']['code']);
    }
  }
  else {
    print(success);
  }

}

projectProvider() async{
  var url = serverUrlTest;
  var query = '''
    query {
      user {
        success
        code
        message
        user {
          projects (showHidden: true) {
            id
            title
            description
            status
            moneyGoal
            moneyPledged
            updatedAt
            lat
            lon
            images {
              file
            }
            category {
              id
            }
          }
        }
      }
    }''';
  var data = {"operationName": null, "variables": {}, "query": query};
  var response = await http.post(url, headers: {
    'content-type': 'application/json',
    'Authorization': sessionId
  }, body: json.encode(data));
  Map<String, dynamic> success;

  success = json.decode(response.body);

  if (success['errors'] == null) {
    if (success['data']['user']['success']) {
      List dataList = success['data']['user']['user']['projects'] as List;
      projectList = (dataList)
          .map((data) => ProjectModel.fromJson(data))
          .toList();

      projectInitiatorList.clear();

      projectList.forEach((element) {
        Project project = new Project.ini(
          element.title,
          element.id,
          element.description,
          element.category,
          element.moneyGoal,
          element.images,
          element.updatedAt,
          element.status,
          element.lat,
          element.lon
        );
        projectInitiatorList.add(project);
      });

      await categoryProvider();

    } else {
      print(success['data']['user']['code']);
    }
  }
  else {
    print(success);
  }
  try {

  } on Exception catch (exception) {
    print (exception);
  } on SocketException catch (_) {
    establishedConnection = false;
  }
}

taskProvider(Project project) async{
  var projectId = project.getId();
  var url = serverUrlTest;
  var query = '''
    query {
      project(id: "$projectId") {
        success
        code
        message
        project {
          tasks {
            id
            title
            description
            supporterGoal
            supporterCount
            applications(filter: {accepted: true}) {
              id
              text
              accepted
              user {
                fullname
                mail
              }
            }
          }
        }
      }
    }''';
  print(query);
  var data = {"operationName": null, "variables": {}, "query": query};
  var response = await http.post(url, headers: {
    'content-type': 'application/json',
    'Authorization': sessionId
  }, body: json.encode(data));
  Map<String, dynamic> success;

  success = json.decode(response.body);

  if (success['errors'] == null) {
    if (success['data']['project']['success']) {

      List taskDataList = success['data']['project']['project']['tasks'] as List;
      print(taskDataList);
      List<ProjectTask> taskList = new List();

      taskDataList.forEach((element) {

        List<Applicant> applicationList = new List();
        List applicationDataList = element['applications'] as List;

        applicationDataList.forEach((application){
          applicationList.add(Applicant.applicantIni(
              application['user']['fullname'],
              application['id'],
              application['user']['mail'],
              application['text'],
              application['accepted']
          ));
        });

        ProjectTask task = new ProjectTask(
            element['id'],
            element['title'],
            element['description'],
            element['supporterGoal'].toString(),
            element['supporterCount'].toString(),
            applicationList,
        );
        taskList.add(task);

      });
      project.setTasks(taskList);
    } else {
      print(success['data']['project']['code']);
    }
  }
  else {
    print(success);
  }
}

applicationsInitiatorProvider(Project project) async{
  var projectId = project.getId();
  var url = serverUrlTest;
  var query = '''
    query {
      applications(filter: {
        projectId: "$projectId"
        accepted: false
      }) {
        success
        code
        message
        applications {
          id
          text
          accepted
          user {
            fullname
            mail
          }
          task {
            title
            description
            supporterGoal
            supporterCount
          }
        }
      }
    }''';
  var data = {"operationName":null,"variables":{},"query":query};
  var response = await http.post(url, headers: {'content-type': 'application/json','Authorization': sessionId}, body: json.encode(data)).timeout(const Duration(seconds: 15));
  Map<String, dynamic> success;

  success = json.decode(response.body);

  if (success['errors'] == null){
    if (success['data']['applications']['success']){

      List<Applicant> applicationList  = new List();

      List applications =  success['data']['applications']['applications'] as List;
      applications.forEach((element) {
        applicationList.add(new Applicant.applicationListIni(
            element['user']['fullname'],
            element['id'],
            element['user']['mail'],
            element['text'],
            element['accepted'],
            element['task']['title'],
            element['task']['description'],
            element['task']['supporterGoal'].toString(),
            element['task']['supporterCount'].toString()
        ));
      });

      project.setApplications(applicationList);
    } else {
      print(success['data']['categories']['code']);
    }

  }
  else {
    print(success);
  }
}


categoryProvider() async{
  try {
    var url = serverUrlTest;
    var query = '''
    query {
      categories(sort: {
        field: NAME
        direction: DESC
      }) {
        success
        code
        message
        categories {
          id
          name
          image {
            file
          }
        }
      }
    }''';
    var data = {"operationName":null,"variables":{},"query":query};
    var response = await http.post(url, headers: {'content-type': 'application/json','Authorization': sessionId}, body: json.encode(data)).timeout(const Duration(seconds: 15));
    Map<String, dynamic> success;

    success = json.decode(response.body);

    if (success['errors'] == null){
      if (success['data']['categories']['success']){
        categoryList = (success['data']['categories']['categories'] as List)
            .map((data) => CategoryModel.fromJson(data))
            .toList();
        print("Test: "+categoryList[0].image);
      } else {
        print(success['data']['categories']['code']);
      }

    }
    else {
      print(success);
    }


  } on SocketException catch (_) {
    establishedConnection = false;
  } on TimeoutException catch (_) {
    establishedConnection = false;
  } on FormatException catch (_) {
    establishedConnection = false;
  }

}