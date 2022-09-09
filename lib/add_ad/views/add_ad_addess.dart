import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class AddAdAddress extends StatefulWidget {
  const AddAdAddress({Key? key}) : super(key: key);

  @override
  State<AddAdAddress> createState() => _AddAdAddressState();
}

class _AddAdAddressState extends State<AddAdAddress> {

  MapController _controller = MapController(
    initMapWithUserPosition: true,
    // initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
    // areaLimit: BoundingBox( east: 10.4922941, north: 47.8084648, south: 45.817995, west: 5.9559113,),
  );

  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
        controller: _controller,
        trackMyPosition: true,
    );
    // return OSMFlutter(
    //   controler: controller,
    //   currentLocation: false,
    //   road: Road(
    //     startIcon: MarkerIcon(
    //       icon: Icon(
    //         Icons.person,
    //         size: 64,
    //         color: Colors.brown,
    //       ),
    //     ),
    //     roadColor: Colors.yellowAccent,
    //   ),
    //   markerIcon: MarkerIcon(
    //     icon: Icon(
    //       Icons.person_pin_circle,
    //       color: Colors.blue,
    //       size: 56,
    //     ),
    //   ),
    //   initPosition: GeoPoint(latitude: 47.35387, longitude: 8.43609),
    // );
    ;
  }
}
