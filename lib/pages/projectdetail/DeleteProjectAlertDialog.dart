import 'package:Swolly/utils/res/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteProjectAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: themeColor,
      title: Text(
        "Delete project",
        style: TextStyle(
        ),
      ),
      content: Text(
        "Are you sure you want to delete this project? Your project can't be restored afterwards.",
        style: TextStyle(
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            "DELETE",
            style: TextStyle(
              color: Colors.red
            ),
          ),
        ),
        FlatButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            "CANCEL",
            style: TextStyle(
              color: Colors.black87
            ),
          ),
        ),
      ],
    );
  }
}