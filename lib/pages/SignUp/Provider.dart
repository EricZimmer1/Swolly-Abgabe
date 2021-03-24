import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Swolly/utils/res/Global.dart';

class SignUpProvider {
  static Future<dynamic> signUpProvider(String mail,password,fullname, gender, role) async{
    var url = serverUrlTest;
    var query = '''
    mutation Register {
      userRegister(values: {
        fullname: "$fullname" 
        mail: "$mail" 
        gender: $gender 
        role: $role 
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
    print(query);
    var data = {"operationName":null,"variables":{},"query":query};
    var response = await http.post(url, headers: {'content-type': 'application/json'},body: json.encode(data));
    Map<String, dynamic> responseData;
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
      if (success['data']['userRegister']['success']){
        sessionId = success['data']['userRegister']['session']['token'];
        userRole = success['data']['userRegister']['user']['role'];
        return 200;
      } else {
        return success['data']['userRegister']['code'];
      }

    }
    else {
      return "Unknown Error, Please check your provided Data";
    }
  }
}