import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Swolly/utils/res/Global.dart';

class SignInProvider {
  static Future<dynamic> signInProvider(String mail,password) async{
    var url = serverUrlTest;
    var query = '''
    mutation {
      userLogin(data: {
        mail: "$mail"
        password: "$password"
      }) {
        success
        code
        message
        user {
          id
          fullname
          mail
          gender
          role
        }
        session {
          id
          token
        }
      }
    }''';
    var data = {"operationName":null,"variables":{},"query":query};
    var response = await http.post(url, headers: {'content-type': 'application/json'}, body: json.encode(data));
    Map<String, dynamic> success;

    try {
      success = json.decode(response.body);
    } on FormatException catch (_) {
      establishedConnection = false;
    }

    if (establishedConnection == false) {
      return "";
    }

    if (success['errors'] == null){
      if (success['data']['userLogin']['success']){
        sessionId = success['data']['userLogin']['session']['token'];
        userRole = success['data']['userLogin']['user']['role'];
        return 200;
      } else {
        return success['data']['userLogin']['code'];
      }
    }
    else {
      return "Unknown Error, Please check your provided Data";;
    }
  }
}