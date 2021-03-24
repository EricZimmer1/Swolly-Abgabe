import 'dart:convert';
import 'dart:io';
import 'package:Swolly/utils/res/Global.dart';
import 'package:http/http.dart' as http;

class ApplicationProvider {

  static Future<dynamic> applicationSendProvider(String text, String taskId,
      String sessionId) async {
    print(taskId);
    try {
      var url = serverUrlTest;
      var query = '''
      mutation {
        applicationCreate(values: {
          text: "$text!"
          taskId: "$taskId"
        }) {
          success
          code
          message
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
        if (success['data']['applicationCreate']['success']) {
          return 200;
        } else {
          print(success['data']['applicationCreate']['code']);
          return "There was an Error sending your application: ${success['data']['applicationCreate']['code']}";
        }
      }
      else {
        print(success);
        return "There was an Error sending your application: ${success['data']['applicationCreate']['code']}";
      }
    } on SocketException catch (_) {
      establishedConnection = false;
    } on FormatException catch (_) {
      establishedConnection = false;
    }
  }

  static Future<dynamic> applicationStatusUpdate(String id, bool accepted,
      String sessionId) async {
    try {
      var url = serverUrlTest;
      var query = '''
      mutation {
        applicationUpdate(values: {
          id: "$id"
          accepted: $accepted
        }) {
          success
          code
          message
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
        if (success['data']['applicationUpdate']['success']) {
          return 200;
        } else {
          print(success['data']['applicationUpdate']['code']);
          return "There was an Error accepting this application: ${success['data']['applicationCreate']['code']}";
        }
      }
      else {
        print(success);
        return "There was an Error accepting this application: ${success['data']['applicationCreate']['code']}";
      }
    } on SocketException catch (_) {
      establishedConnection = false;
    } on FormatException catch (_) {
      establishedConnection = false;
    }
  }

  static Future<dynamic> applicationDelete(String id, String sessionId) async {
    try {
      print(id);
      var url = serverUrlTest;
      var query = '''
      mutation {
        applicationDelete(id: "$id") {
          success
          code
          message
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
        if (success['data']['applicationDelete']['success']) {
          return 200;
        } else {
          print(success['data']['applicationDelete']['code']);
          return "There was an Error declining this application: ${success['data']['applicationDelete']['code']}";
        }
      }
      else {
        print(success);
        return "There was an Error declining this application: ${success['data']['applicationDelete']['code']}";
      }
    } on SocketException catch (_) {
      establishedConnection = false;
    } on FormatException catch (_) {
      establishedConnection = false;
    }
  }

}