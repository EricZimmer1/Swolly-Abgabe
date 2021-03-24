import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:transparent_image/transparent_image.dart';

class projectDetailHeader implements SliverPersistentHeaderDelegate {
  projectDetailHeader(this.title, this.creationDate, this.img, {
    this.minExtent,
    @required this.maxExtent,
  });
  final double minExtent;
  final double maxExtent;
  final String title, creationDate, img;


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        FadeInImage.memoryNetwork(
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: kTransparentImage,
          image: serverUrlImages+img,
        ),

        Align(
          alignment: Alignment.topLeft,
          heightFactor: 10,
          child: Container(
            margin: EdgeInsets.only(top: 8, left: 8),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ),

        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                  margin: EdgeInsets.only(left: 32, top: 55),
                  child: Text(
                      title,
                      style: profileH1
                  )
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 32),
                    child: Icon(Icons.access_time, color: Colors.white.withOpacity(titleOpacity(shrinkOffset)),),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 24),
                      child: Text(
                          DateTime.fromMillisecondsSinceEpoch(int.parse(creationDate)).day.toString() + "."+
                              DateTime.fromMillisecondsSinceEpoch(int.parse(creationDate)).month.toString() + "."+
                              DateTime.fromMillisecondsSinceEpoch(int.parse(creationDate)).year.toString() + " at "+
                              DateTime.fromMillisecondsSinceEpoch(int.parse(creationDate)).hour.toString() + ":"+
                              DateTime.fromMillisecondsSinceEpoch(int.parse(creationDate)).minute.toString(),
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white.withOpacity(titleOpacity(shrinkOffset))
                          ))
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
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
