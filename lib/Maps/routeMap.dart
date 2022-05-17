// ignore_for_file: prefer_const_constructors

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Screens/placeScreen.dart';

class SingleRouteMap extends StatefulWidget {
  final String title;

  const SingleRouteMap({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<SingleRouteMap> createState() => _SingleRouteMapState();
}

class _SingleRouteMapState extends State<SingleRouteMap> {
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  final LatLng _latLng = LatLng(37.779242321596264, -25.47076162990895);
  final double _zoom = 9.0;
  late Position currentPosition;
  var geoLocator = Geolocator();

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
  }

  Set<Marker> markers = new Set();
  Set<Polyline> routes = new Set();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(16, 125, 125, 1),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: new Row(
                    children: [
                      Container(
                        width: 250,
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                ),
                Builder(
                  builder: (context) => IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
          //leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ),
        body: Container(
          child: new Stack(
            children: <Widget>[
              GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                onTap: (position) {
                  _customInfoWindowController.hideInfoWindow!();
                },
                polylines: getSingleRouteMap(),
                onCameraMove: (position) {
                  _customInfoWindowController.onCameraMove!();
                },
                onMapCreated: (GoogleMapController controller) async {
                  _customInfoWindowController.googleMapController = controller;
                  controller.setMapStyle(Utils.mapStyle);
                  locatePosition();
                },
                markers: getmarkers(),
                initialCameraPosition: CameraPosition(
                  target: _latLng,
                  zoom: _zoom,
                ),
              ),
              CustomInfoWindow(
                controller: _customInfoWindowController,
                height: 60,
                width: 220,
                offset: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Set<Polyline> getSingleRouteMap() {
    setState(
      () {
        routes.add(
          Polyline(
              polylineId: PolylineId('route1'),
              points: [
                LatLng(37.779242321596264, -25.47076162990895),
                LatLng(37.87198725783931, -25.8339971009735)
              ],
              width: 3),
        );
      },
    );
    return routes;
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(
      () {
        //PlaceScreen
        markers.add(
          Marker(
            markerId: MarkerId("PlaceScreen"),
            position: LatLng(37.779242321596264, -25.47076162990895),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(129, 195, 215, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Text(
                                      "Origem",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromRGBO(129, 195, 215, 1),
                                          fontFamily: 'Metropolis',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(title: 'title', index:1, text: 'text',),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.779242321596264, -25.47076162990895),
              );
            },
          ),
        );
        //Destination
        markers.add(
          Marker(
            markerId: MarkerId("Destination"),
            position: LatLng(37.87198725783931, -25.8339971009735),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(129, 195, 215, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  "Destino",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          /* Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SingleRouteMap(),
                            ),
                          ),*/
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.87198725783931, -25.8339971009735),
              );
            },
          ),
        );
        //PlaceScreen
        markers.add(
          Marker(
            markerId: MarkerId("PlaceScreen"),
            position: LatLng(37.805830268894105, -25.75365954928967),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(129, 195, 215, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Text(
                                      "Origem",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromRGBO(129, 195, 215, 1),
                                          fontFamily: 'Metropolis',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(title: 'title', index:1, text: 'text',),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.805830268894105, -25.75365954928967),
              );
            },
          ),
        );
        //Destination
        markers.add(
          Marker(
            markerId: MarkerId("Destination"),
            position: LatLng(37.797692117270536, -25.289487189290355),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(129, 195, 215, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // ignore: prefer_const_constructors
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  "Destino",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          /* Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SingleRouteMap(),
                            ),
                          ),*/
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.797692117270536, -25.289487189290355),
              );
            },
          ),
        );
      },
    );

    return markers;
  }
}

class Utils {
  static String mapStyle = '''[
] ''';
}
