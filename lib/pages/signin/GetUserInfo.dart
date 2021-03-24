import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Swolly/utils/res/Global.dart';

class GetUserInfo {
  static Future<dynamic> getUserInfo(String sessionId) async{
    var url = serverUrl+'/self.php';
    //var data = {'mail': mail, 'password' : password};
    var response = await http.post(url, headers: {'Cookie': 'PHPSESSID='+sessionId});
    Map<String, dynamic> eMsg;

    if (response.statusCode == 200){
      Map<String, dynamic> map = json.decode(response.body);
      userRole = map["role"];
      print(json.decode(response.body));
      return 200;
    }
    else {
      eMsg = json.decode(response.body);
      print(json.decode(response.body));
      return eMsg['msg'];
    }
  }
}