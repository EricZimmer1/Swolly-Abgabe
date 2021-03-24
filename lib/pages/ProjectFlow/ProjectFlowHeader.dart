import 'dart:math';

import 'package:Swolly/utils/res/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProjectFlowHeader implements SliverPersistentHeaderDelegate {
  ProjectFlowHeader( this.pageTitle, this.pageDescription, {
    this.minExtent,
    @required this.maxExtent,
  });
  final double minExtent, maxExtent;
  final String pageTitle, pageDescription;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: themeGreen,
      padding: EdgeInsets.only(top: 0, left: 8, right: 0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 0),
            child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size:32,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left:12, top: 4),
            child: Text(
              pageTitle,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  letterSpacing: 2
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, top: 8),
            child: Text(
              pageDescription ,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  letterSpacing: 1
              ),
            ),
          ),
        ],
      ),
    );
  }

  double titleOpacity(double shrinkOffset){
    double percentScrolled = (maxExtent / 100) * shrinkOffset;
    if (percentScrolled >= 0.75) {
      return 0;
    } else {
      return 1.0 - max(0.0, shrinkOffset) / maxExtent;
    }
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration => null;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  @override
  TickerProvider get vsync => null;

}