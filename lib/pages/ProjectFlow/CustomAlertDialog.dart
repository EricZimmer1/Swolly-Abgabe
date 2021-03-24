
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Swolly/utils/res/Colors.dart';

class CustomAlertDialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: primaryColor,
      title: Text(
        "Confirm",
        style: TextStyle(
            color: Colors.white
        ),
      ),
      content: Text(
        "Are you sure you want to delete this task?",
        style: TextStyle(
            color: Colors.white
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            "DELETE",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
        FlatButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            "CANCEL",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
}