import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Swolly/pages/projectdetail/projectDetailAdvancedWidget.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProjectDetail(),
  ));
}

class ProjectDetail extends StatefulWidget {
  int initialPage=0;
  String category;
  ProjectDetail({Key key, this.initialPage, this.category}) : super(key: key);

  @override
  _ProjectDetailState createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: projectProviderCategory(widget.category),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            if(projectListCategory.length == 0){
              return SafeArea(
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: themeGreen,
                      leading: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                      title: Text("No Projects"),
                      centerTitle: true,
                    ),
                    body: Center(
                      child: Text(
                        "We're sorry!\nFor this category we currently don't have any projects!",
                        style: projectDetailText,
                      ),
                    ),
                  )
              );
            }
            return SafeArea(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    //aspectRatio: 16/9,
                    viewportFraction: 1,
                    initialPage: widget.initialPage,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 10),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: projectListCategory.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.amber
                            ),
                            child: projectDetailAdvancedWidget(
                              title: i.title,
                              img: i.images,
                              description: i.description,
                              moneyGoal: i.moneyGoal,
                              creationDate: i.updatedAt,
                              tasks: i.tasks,
                              location: LatLng(i.lat, i.lon),
                            ) //creationDate: i.created,)
                        );
                      },
                    );
                  }).toList(),
                ));
          }
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(
              heightFactor: 1,
              widthFactor: 1,
              child: SizedBox(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                ),
              ),
            );
          }
          return Container(
            padding: EdgeInsets.only(top: 250),
            child: Column(
              children: [
                Text(
                  "An Error occurred",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      letterSpacing: 2
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                ButtonTheme(
                    height: 52,
                    minWidth: 150,
                    child: FlatButton(
                      color: Color(0xff00AA4F),
                      textColor: Colors.black,
                      onPressed: () => setState(() {}),
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
          );
        }
    );
  }
}


