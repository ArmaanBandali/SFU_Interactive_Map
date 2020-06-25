import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Buildings {
  //Base building info
  String buildingName;
  String abbreviation;
  List<LatLng> buildingCoords;
  Buildings(this.buildingName, this.buildingCoords);
  Buildings.withAbbreviation(
      this.buildingName, this.abbreviation, this.buildingCoords);
}

class AllBuildings {
  List<Buildings> allBuildings = [];

  AllBuildings() {
    allBuildings.add(
      Buildings.withAbbreviation('West Mall Centre', 'WMC', <LatLng>[
        //Example for adding polygon coordinates and id through constructor
        LatLng(49.279700, -122.922640),
        LatLng(49.280010, -122.922525),
        LatLng(49.279775, -122.920975),
        LatLng(49.279465, -122.921075),
      ]),
    ); //add
    allBuildings.add(
      Buildings.withAbbreviation('Maggie Benson Centre', 'MBC', <LatLng>[
        LatLng(49.279180, -122.919500),
        LatLng(49.279055, -122.919550),
        LatLng(49.279125, -122.919975),
        LatLng(49.278900, -122.920045),
        LatLng(49.278825, -122.919670),
        LatLng(49.278500, -122.919355),
        LatLng(49.278250, -122.919450),
        LatLng(49.278200, -122.919100),
        LatLng(49.278475, -122.918990),
        LatLng(49.278420, -122.918625),
        LatLng(49.279020, -122.918435),
      ]),
    ); //add
  } //addBuilding

}
