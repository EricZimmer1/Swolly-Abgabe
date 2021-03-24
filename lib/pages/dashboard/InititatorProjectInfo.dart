import 'package:Swolly/pages/ProjectFlow/ProjetFlowNew1.dart';
import 'package:Swolly/pages/projectdetail/DeleteProjectAlertDialog.dart';
import 'package:Swolly/pages/projectdetail/InitiatorTaskItem.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Project.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:Swolly/utils/res/Transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InitiatorProjectInfo extends StatefulWidget{
  @required
  final Project project;

  const InitiatorProjectInfo({this.project});

  @override
  _InitiatorProjectInfoState createState() => _InitiatorProjectInfoState();
}

class _InitiatorProjectInfoState extends State<InitiatorProjectInfo> {

  Future taskFuture;
  GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId,Marker>{};
  MarkerId selectedMarker;
  int _markerIdCounter = 0;

  final LatLng _center = const LatLng(52.494515145986504, 13.519916890496129);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    final int markerCount = markers.length;

    if (markerCount == 12) {
      return;
    }

    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: widget.project.getLocation(),
      //position: _center,
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  @override
  void initState() {
    taskFuture = taskProvider(widget.project);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: taskFuture,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    child: Container(
                      margin: EdgeInsets.only(top: 12, left: 24, right: 24),
                      child: Column(
                        children: [
                          Visibility(
                            visible: ((){
                              if (widget.project.getStatus() == "NEEDS_VERIFICATION"){
                                return true;
                              } else {
                                return false;
                              }
                            }()),
                            child: Container(
                              decoration: BoxDecoration(
                                //color: Color(0xffE0E0E0),
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                border: Border.all(
                                  color: Colors.red,
                                  width: 2
                                )
                              ),
                              margin: EdgeInsets.only(bottom: 12, top: 4),
                              child: Container(
                                margin: EdgeInsets.only(left:12, right: 12, bottom: 12, top: 4),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.warning_rounded,
                                      size: 40,
                                      color: Colors.red,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8, bottom: 8),
                                      width: double.infinity,
                                      child: Align(
                                        child: Text(
                                          "This project has not yet been verified!",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "To ensure all projects on Swolly follow our "
                                          "guidelines each project has to be reviewed "
                                          "before it is visible for the public. Until "
                                          "the review process is done, this project is "
                                          "only visible to you. Thank you for your patience!",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.red,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              widget.project.title,
                              style: projectDetailH1,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "last updated on "+ widget.project.getCreated() +",",
                                style: projectDetailTextItalic,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              widget.project.description,
                              style: projectDetailText,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Location",
                                style: projectDetailH3,
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            height: 150,
                            child: GoogleMap(
                              onMapCreated: _onMapCreated,
                              initialCameraPosition: CameraPosition(
                                target: widget.project.getLocation(),
                                //target: _center,
                                zoom: 15.0,
                              ),
                              markers: Set<Marker>.of(markers.values),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 12, bottom: 12),
                            child: Text(
                              "Tasks",
                              style: projectDetailH3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (context, index) => InitiatorTaskItem(
                        task: widget.project.getTasks()[index],
                      ),
                      childCount: widget.project.getTasks().length
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Category:",
                              style: projectDetailH3,
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Text(
                              getCategoryName(widget.project.getCategory()).toString(),
                              style: projectDetailH3Normal,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              "Money Goal:",
                              style: projectDetailH3,
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Text(
                              widget.project.getMoneyGoal().toString()+"\$",
                              style: projectDetailH3Normal,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
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
            padding: EdgeInsets.only(top: 20),
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

  /*ButtonTheme(
  height: 64,
  minWidth: double.infinity,
  child: FlatButton(
  color: Color(0xff00AA4F),
  textColor: Colors.black,
  onPressed: () {

  },
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(8),
  ),
  child: Text("Edit Project",
  style: TextStyle(
  fontSize: 18,
  color: Colors.white,
  letterSpacing: 0.5)),
  ),
  ),
  SizedBox(
  height: 12,
  ),
  ButtonTheme(
  height: 64,
  minWidth: double.infinity,
  child: FlatButton(
  color: Colors.red,
  textColor: Colors.black,
  onPressed: () async{
  await showDialog(
  context: context,
  builder: (BuildContext context) {
  return DeleteProjectAlertDialog();
  },
  ).then((value){
  if (value){

  }
  });
},
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(8),
),
child: Text("Delete Project",
style: TextStyle(
fontSize: 18,
color: Colors.white,
letterSpacing: 0.5)),
),
),*/


  String getCategoryName(String id) {
    String name;
    categoryList.forEach((element) {
      if (element.id == id) {
        name = element.name.toString();
      }
    });
    return name;
  }

}