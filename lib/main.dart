import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_villains/villains/villains.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Swolly/pages/ProjectFlow/ProjectFlow2.dart';
import 'package:Swolly/pages/SignUp/SignUp.dart';
import 'package:Swolly/pages/dashboard/DashboardInitiator.dart';
import 'package:Swolly/pages/dashboard/DashboardUser.dart';
import 'package:Swolly/pages/signin/ErrorPage.dart';
import 'package:Swolly/pages/signin/SignIn.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Transitions.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    navigatorObservers: [VillainTransitionObserver()],
    theme: ThemeData(
        textTheme: GoogleFonts.varelaTextTheme(
        )
    ),
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget{
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  _startTimeout() {
    categoryProvider().then((val){
      if (establishedConnection){
        DEBUG ?? print("INFO:: DEBUG MODE ACTIVE");
        Timer(Duration(milliseconds: 1500), () {
          Navigator.of(context).pushReplacement(FadeRouteBuilder(
              page: SignIn(),
              transitionTime: 1200 // milliseconds
          ));
        });
      } else {
        Navigator.of(context).pushReplacement(FadeRouteBuilder(
          page: ErrorPage()
        ));
      }
    });
  }

  @override
  void initState(){
    super.initState();
    loadSharedPreferences().then((val){
      _startTimeout();
    });
  }

  @override
  Widget build(BuildContext context) {

    // Transparent Status Bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    // Hides Bottom Bar
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    // Portrait View only
    SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown
        ]
    );
    return Material(
      color: themeColor,
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Hero(
                tag: "logo",
                child: Container(
                  margin: EdgeInsets.all(32),
                  child: Image(
                    image: AssetImage(
                        "lib/assets/images/Logo-Final.png"
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}