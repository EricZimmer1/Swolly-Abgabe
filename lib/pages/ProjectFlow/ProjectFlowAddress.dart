import 'package:Swolly/utils/res/Colors.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Styles.dart';
import 'package:Swolly/utils/res/Transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';

import '../../credentials.dart';
import 'ProjectFlow2.dart';
import 'ProjectFlowHeader.dart';

class ProjectFlowAddress extends StatefulWidget {
  @override
  _ProjectFlowAddressState createState() => _ProjectFlowAddressState();
}

class _ProjectFlowAddressState extends State<ProjectFlowAddress> {

  final LatLng _center = const LatLng(52.5207209821696, 13.409599716035327);
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
      position: ((){
        if (createProject.getLocation() == null){
          return _center;
        } else {
          return createProject.getLocation();
        }
      }()),
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
                floating: true,
                delegate: ProjectFlowHeader(
                  "Location", "Please provide where your project is located. These infos will be displayed on your project page.",
                  minExtent: 172,
                  maxExtent: 172,
                )
            ),
            SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 12, left: 12, right: 12),
                  child: ButtonTheme(
                    height: 64,
                    minWidth: double.infinity,
                    child: FlatButton(
                      color: Color(0xff00AA4F),
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlacePicker(
                              apiKey: PLACES_API_KEY_DEV,
                              onPlacePicked: (result) {
                                createProject.setLocation(LatLng(result.geometry.location.lat, result.geometry.location.lng));
                                print(result.geometry.location.lat);
                                print(result.geometry.location.lng);
                                print(result.formattedAddress);
                                String addressString = result.formattedAddress;
                                createProject.setAddress(addressString.split(", "));
                                //address = addressString.split(", ");
                                print(createProject.getAddress()[0]);
                                print(createProject.getAddress()[1]);
                                print(createProject.getAddress()[2]);
                                Navigator.of(context).pop();
                                setState(() {});
                              },
                              initialPosition: (() {
                                if (createProject.getLocation() == null) {
                                  return _center;
                                } else {
                                  return createProject.getLocation();
                                }
                              }()),
                              useCurrentLocation:  false,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Select location",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            letterSpacing: 0.5
                        ),
                      ),
                    ),
                  )
                )
            ),
            SliverToBoxAdapter(
              child: Visibility(
                visible: ((){
                  if (createProject.getLocation() == null) {
                    return false;
                  } else {
                    return true;
                  }
                }()),
                child: Container(
                  margin: EdgeInsets.only(top: 12, left: 24, right: 24),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "You picked:",
                            style: projectDetailH2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(
                            ((){
                              if (createProject.getLocation() == null) {
                                return "";
                              } else {
                                return createProject.getAddress()[0];
                              }
                            }()),
                            style: projectDetailText,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            ((){
                              if (createProject.getLocation() == null) {
                                return "";
                              } else {
                                return createProject.getAddress()[1];
                              }
                            }()),
                            style: projectDetailText,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            ((){
                              if (createProject.getLocation() == null) {
                                return "";
                              } else {
                                return createProject.getAddress()[2];
                              }
                            }()),
                            style: projectDetailText,
                          ),
                        ],
                      ),
                      Container(
                        height: 150,
                        child: GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: ((){
                              if (createProject.getLocation() == null){
                                return _center;
                              } else {
                                return createProject.getLocation();
                              }
                            }()),
                            zoom: 15.0,
                          ),
                          markers: Set<Marker>.of(markers.values),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        child: ButtonTheme(
                          height: 64,
                          minWidth: double.infinity,
                          child: FlatButton(
                            color: Color(0xff00AA4F),
                            textColor: Colors.black,
                            onPressed: (){
                              Navigator.of(context).push(FadeRouteBuilder(page: ProjectFlow2()));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text("NEXT",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    letterSpacing: 0.5)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

