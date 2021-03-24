import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

File _image;
final picker = ImagePicker();
Future<dynamic> getImage() async {
  final pickedFile = await picker.getImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    final _image = File(pickedFile.path);
    String base64image = base64Encode(_image.readAsBytesSync());
    print(_image.toString());
    return ImageProvider.imageUpload(pickedFile.path);
  } else {
    print('No image selected.');
  }
}

class ImageProvider {

  static Future<dynamic> imageUpload(String file) async{
    var url = serverUrlTest;
    var variables = { "file": null };
    var query ='''
    mutation upload (\$file: Upload!) {
      imageUpload(file: \$file) {
        success
        code
        message
        image {
          id
          extension
          file
        }
      }
    }''';
    var operations = {"query": query, "variables": variables};
    var map = '{ "0": ["variables.file"] }';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields["operations"] = json.encode(operations);
    request.fields["map"] = map;
    request.headers["Authorization"] = sessionId;
    request.files.add(await http.MultipartFile.fromPath("0", file));
    var response = await request.send();

    if (response.statusCode == 200){
      Map<String, dynamic> map = json.decode(await response.stream.bytesToString());
      print(map.toString());
      createProject.setImage(map["data"]["imageUpload"]["image"]["file"]);
      print(map["data"]["imageUpload"]["image"]["file"]);
      print(createProject.getImage());
      return 200;
    }
    else {
      print(response.statusCode);
      print(response.reasonPhrase);
      print(await response.stream.bytesToString());
    }
  }
}
