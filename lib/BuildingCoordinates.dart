import 'dart:core';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Buildings{ //Base building info
  String buildingName;
  String abbreviation;
  List<LatLng> buildingCoords;
  Buildings(this.buildingName, this.buildingCoords);
  Buildings.withAbbreviation(this.buildingName, this.abbreviation, this.buildingCoords);
}

class AllBuildings{
  List<Buildings> allBuildings = [];

  AllBuildings(){
    allBuildings.add(Buildings.withAbbreviation('West Mall Centre', 'WMC', <LatLng>[ //Example for adding polygon coordinates and id through constructor
      LatLng(49.279700, -122.922640),
      LatLng(49.280010, -122.922525),
      LatLng(49.279775, -122.920975),
      LatLng(49.279465, -122.921075)
      ])
    );//add
  }//addBuilding

}