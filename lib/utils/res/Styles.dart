import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Swolly/utils/res/Colors.dart';

const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

// General
const TextStyle H1B = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,decoration: TextDecoration.none);
const TextStyle H1 = TextStyle(fontSize: 24, color: Colors.white,decoration: TextDecoration.none);
const TextStyle H2 = TextStyle(fontSize: 22, color: Colors.white,decoration: TextDecoration.none);
const TextStyle H3 = TextStyle(fontSize: 18, color: Colors.white,decoration: TextDecoration.none);
const TextStyle H4G = TextStyle(fontSize: 14, color: Colors.grey,decoration: TextDecoration.none);

// Setting styles
const TextStyle settingsH1 = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey, decoration: TextDecoration.none);
const TextStyle settingsH2 = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 0.5);
const TextStyle settingsH3 = TextStyle(fontSize: 16, color: Colors.grey, letterSpacing: 0.5);
const TextStyle settingsH3B = TextStyle(fontSize: 16, letterSpacing: 0.5);
const TextStyle settingsH4G = TextStyle(fontSize: 14, color: Colors.grey, letterSpacing: 0.5);

const TextStyle impressH1 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5);
const TextStyle impressH2 = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5);
const TextStyle impressH3 = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 0.5);

const TextStyle loginH1 = TextStyle(fontSize: 20,color:  Colors.black);
const TextStyle loginH2 = TextStyle(fontSize: 16,color:   Colors.black);

const OutlineInputBorder focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(4)),
  borderSide: BorderSide(width: 2,color: Color(0xffbf360c)),
);

const OutlineInputBorder border = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(4)),
  borderSide: BorderSide(width: 1,)
);

// Dashboard styles
const TextStyle dashboardCard2 = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5);

// Profile styles
const TextStyle profileH1 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,decoration: TextDecoration.none);
const TextStyle profileH4 = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,decoration: TextDecoration.none);
const TextStyle projectDetailH1 = TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black87);
const TextStyle projectDetailH1White = TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white);
const TextStyle projectDetailH2 = TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87);
const TextStyle projectDetailH3 = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87);
const TextStyle projectDetailH3Normal = TextStyle(fontSize: 20, color: Colors.black87);
const TextStyle projectDetailText = TextStyle(fontSize: 16, color: Colors.black87);
const TextStyle projectDetailTextItalic = TextStyle(fontStyle: FontStyle.italic , fontSize: 16, color: Colors.black87);

// Textfield input decorations
const InputDecoration standardDeco = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 8),
  border: OutlineInputBorder(
      borderSide: BorderSide(
          color: Color(0xff848A9C), width: 2)),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: Color(0xff848A9C), width: 2)),
  focusedBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: Colors.green, width: 2)),
  errorBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: Colors.red, width: 2)),
  labelStyle: loginH2,);
