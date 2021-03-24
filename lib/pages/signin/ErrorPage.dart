import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:Swolly/main.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Transitions.dart';

class ErrorPage extends StatefulWidget {
  @override
  ErrorPageState createState() {
    return ErrorPageState();
  }
}

class ErrorPageState extends State<ErrorPage>{

  @override
  Widget build(BuildContext context){
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Material(
      color: themeColor,
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              Image.asset(
                "lib/assets/images/Logo-Final-No-Text.png",
                height: 200,
              ),
              Container(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  "Unable to connect to the server! Please check"
                  " your internet connection.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      letterSpacing: 1
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              ButtonTheme(
                  height: 52,
                  minWidth: 150,
                  child: FlatButton(
                    color: Color(0xff00AA4F),
                    textColor: Colors.black,
                    onPressed: () {
                      establishedConnection = true;
                      Navigator.of(context)
                          .pushReplacement(FadeRouteBuilder(page: SplashScreen()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text("Retry",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            letterSpacing: 0.5)),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

}