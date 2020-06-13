import 'dart:core';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';


class MyBuildings{
  Set <Polygon> _buildings = new Set();
  String buildingName = 'A';

  List<LatLng> coords =[
    LatLng(49.279075, -122.919000),
    LatLng(49.279080, -122.919000),
    LatLng(49.279080, -122.918090),
    LatLng(49.279075, -122.918090)
  ];


  void addPolygon(){
    _buildings.add(Polygon(
      polygonId: PolygonId(buildingName),
      points: coords,
      strokeColor: Colors.blue,
      strokeWidth: 1,
      fillColor: Colors.blue.withOpacity(0.4),
    ),);
  }

  String test(){
    return buildingName;
  }

  Set <Polygon> buildingSet(){
    return _buildings;
  }

}
