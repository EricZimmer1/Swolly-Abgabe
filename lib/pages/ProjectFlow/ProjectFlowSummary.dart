import 'package:Swolly/pages/ProjectFlow/ProjectFlowHeader.dart';
import 'package:Swolly/pages/ProjectFlow/TaskCardForFlow.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Project.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:Swolly/utils/res/Transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'ProjectFlow6.dart';
import 'ProjectFlowProvider.dart';

class ProjectFlowSummary extends StatefulWidget {
  @override
  _ProjectFlowSummaryState createState() => _ProjectFlowSummaryState();
}

class _ProjectFlowSummaryState extends State<ProjectFlowSummary> {

  GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId,Marker>{};
  MarkerId selectedMarker;
  int _markerIdCounter = 0;

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
      position: createProject.getLocation(),
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) =>
          CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                  floating: true,
                  delegate: ProjectFlowHeader(
                    "Project Summary", "Please check the information you've provided and go back if something is wrong",
                    maxExtent: 172,
                    minExtent: 172,
                  )
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 12, left: 12, right: 12),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "Project Name",
                            style: projectDetailH2,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          createProject.getTitle(),
                          style: projectDetailText,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Description",
                            style: projectDetailH2,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          createProject.getDescription(),
                          style: projectDetailText,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Picture",
                            style: projectDetailH2,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(serverUrlImages+createProject.getImage())
                            )
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Location",
                            style: projectDetailH2,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 150,
                        child: GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: createProject.getLocation(),
                            zoom: 15.0,
                          ),
                          markers: Set<Marker>.of(markers.values),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Money Goal",
                            style: projectDetailH2,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            createProject.getMoneyGoal().toString() + "\$",
                            style: projectDetailText,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Tasks",
                            style: projectDetailH2,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) => TaskCardForFlow(
                      title: taskObjectList[index].getTitle(),
                      description: taskObjectList[index].getDescription(),
                      supportersNeeded: taskObjectList[index].getSupportersNeeded(),
                    ),
                    childCount: taskObjectList.length-1,
                  )
              ),
              SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 16, left: 12, right: 12),
                        child: ButtonTheme(
                          height: 64,
                          minWidth: double.infinity,
                          child: FlatButton(
                            color: themeGreen,
                            onPressed: (){
                              ProjectFlowProvider.projectFlowProvider(createProject.getTitle(), createProject.getDescription(), createProject.getCategory(), createProject.getMoneyGoal(), createProject.getImage(), createProject.getLocation(), createProject.getTasks(), sessionId).then((value) {
                                if (value == 200){
                                  createProject = new Project();
                                  projectAdd.clear();
                                  taskList.clear();
                                  taskList.add("Add");
                                  Navigator.of(context).pushReplacement(FadeRouteBuilder(page: ProjectFlow6()));
                                }else{
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(content: Text(value)));
                                }
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text("Publish your Project",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    letterSpacing: 0.5
                                )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      )
                    ],
                  )
              )
            ],
          ),
      ),
    );
  }
}