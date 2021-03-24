import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Swolly/pages/projectdetail/TaskCard.dart';
import 'package:Swolly/pages/projectdetail/projectDetailHeader.dart';
import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class projectDetailAdvancedWidget extends StatefulWidget {
  @required
  final String title, description, creationDate, img;
  final double moneyGoal;
  final List tasks;
  final LatLng location;

  const projectDetailAdvancedWidget(
      {this.title, this.img, this.description, this.moneyGoal, this.creationDate, this.tasks, this.location});

  @override
  _projectDetailAdvancedWidgetState createState() => _projectDetailAdvancedWidgetState();
}

class _projectDetailAdvancedWidgetState extends State<projectDetailAdvancedWidget> {

  GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId,Marker>{};
  MarkerId selectedMarker;
  int _markerIdCounter = 0;

  //final LatLng _center = const LatLng(52.494515145986504, 13.519916890496129);

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
      position: widget.location,
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            //floating: true,
            delegate: projectDetailHeader(
              widget.title, widget.creationDate, widget.img,
              minExtent: 150,
              maxExtent: 0.35 * MediaQuery.of(context).size.height,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 16, left: 24),
                        child: Text(
                          "Project Description",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black87
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 12, left: 24, right: 24),
                    child: Text(
                      widget.description,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top:12, left: 24, right: 24),
                    child: Text(
                      "Location",
                      style: projectDetailH2,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12, left: 24, right: 24),
                    height: 150,
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: widget.location,
                        zoom: 15.0,
                      ),
                      markers: Set<Marker>.of(markers.values),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 16, left: 24),
                        child: Text(
                          "Project Tasks",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black87
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => TaskCard(
                    title: widget.tasks[index]['title'],
                    description: widget.tasks[index]['description'],
                    //description: "This is a long description for testing the specific field called Description in the TaskCard, containing lots of interesting words and phrases to get a very very long description. It only is so long to show that text will cut of at a specific point and will only be displayed correctly on the next page. By the way, Hi there!",
                    supportersNeeded: widget.tasks[index]['supporterGoal'],
                    supportersNow: widget.tasks[index]['supporterCount'],
                    status: "pending",
                    id: widget.tasks[index]['id'],
                  ),
                childCount: widget.tasks.length,
              )
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          )
        ],
      ),
    );
  }

}