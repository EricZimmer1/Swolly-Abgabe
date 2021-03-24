import 'dart:convert';
import 'dart:io';
import 'package:Swolly/utils/res/ProjectTask.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:Swolly/utils/res/Global.dart';

class ProjectFlowProvider {
  static Future<dynamic> projectFlowProvider(String title, String description, String category, double moneyGoal, String image, LatLng location, List<ProjectTask> tasks, String sessionId) async{

    try {
      double lat = location.latitude;
      double long = location.longitude;
      List<String> _image = image.split(".");
      String imageId = _image[0];
      print(imageId);
      var url = serverUrlTest;
      var query = '''
      mutation projectCreate {
        projectCreate(values: {
          title: "$title"
          description: "$description"
          moneyGoal: $moneyGoal
          lat: $lat
          lon: $long
          CategoryId: "$category"
          ImageIds: ["$imageId"]
        }) {
          success
          code
          message
          project{
            id
          }
        }
      }''';
      var data = {"operationName":null,"variables":{},"query":query};
      var response = await http.post(url, headers: {'content-type': 'application/json','Authorization': sessionId}, body: json.encode(data));
      Map<String, dynamic> success;

      success = json.decode(response.body);

      if (success['errors'] == null){
        if (success['data']['projectCreate']['success']){
          String projectId = success['data']['projectCreate']['project']['id'];
          tasks.forEach((element) async {
            await taskFlowProvider(projectId, element, sessionId);
          });
          return 200;
        } else {
          print("Project: "+success['data']['projectCreate']['code']);
        }

      }
      else {
        print(success);
      }


    } on SocketException catch (_) {
      establishedConnection = false;
    } on FormatException catch (_) {
      establishedConnection = false;
    }

  }

  static Future<dynamic>  taskFlowProvider(String projectId, ProjectTask task, String sessionId) async{

    try {
      String title = task.getTitle();
      String desc = task.getDescription();
      String supporters = task.getSupportersNeeded();
      var url = serverUrlTest;
      var query = '''
      mutation {
        taskCreate(values: {
          title: "$title"
          description: "$desc"
          supporterGoal: $supporters
          projectId: "$projectId"
        }) {
          success
          code
          message
          task {
            id
          }
        }
      }''';
      var data = {"operationName":null,"variables":{},"query":query};
      var response = await http.post(url, headers: {'content-type': 'application/json','Authorization': sessionId}, body: json.encode(data));
      Map<String, dynamic> success;

      success = json.decode(response.body);

      if (success['errors'] == null){
        if (success['data']['taskCreate']['success']){

        } else {
          print("Project: "+success['data']['taskCreate']['code']);
        }

      }
      else {
        print(success);
      }


    } on SocketException catch (_) {
      establishedConnection = false;
    } on FormatException catch (_) {
      establishedConnection = false;
    }

  }

}