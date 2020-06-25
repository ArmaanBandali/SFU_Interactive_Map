import 'dart:core';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Buildings{ //Base building info
  String buildingName;
  List<LatLng> buildingCoords;
  Buildings(this.buildingName,this.buildingCoords);
}

class AllBuildings{
  List<Buildings> allBuildings = [];

  AllBuildings(){
    allBuildings.add(Buildings('sfu', <LatLng>[ //Example for adding polygon coordinates and id through constructor
      LatLng(49.279075, -122.919000),
      LatLng(49.279180, -122.919000),
      LatLng(49.279180, -122.918090),
      LatLng(49.279075, -122.918090)
      ])
    );//add
  }//addBuilding

}