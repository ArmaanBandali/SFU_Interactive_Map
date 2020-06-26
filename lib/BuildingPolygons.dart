import 'dart:core';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'BuildingCoordinates.dart';


class MyBuildings{
  Set <Polygon> _buildings = new Set(); //Holds polygons to be drawn
  List <Buildings> _allBuildings = new AllBuildings().allBuildings; //Holds all of the building coordinates and names

  MyBuildings(){ //Creates a polygon for each building
    int i=0;
    while (i < _allBuildings.length){
      _buildings.add(Polygon(
      polygonId: PolygonId(_allBuildings[i].buildingName),
      points: _allBuildings[i].buildingCoords,
      strokeColor: Colors.blue,
      strokeWidth: 1,
      fillColor: Colors.blue.withOpacity(0.4),
      ),);
      i++;
    }
  }

  Set <Polygon> buildingSet(){ //Return set of Polygons
    return _buildings;
  }

  Buildings getBuilding(index) {
    return _allBuildings[index];
  }
}
