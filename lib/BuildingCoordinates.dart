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
        LatLng(49.279780, -122.920965),
        LatLng(49.279465, -122.921075),
      ]),
    ); //add
    allBuildings.add(
      Buildings.withAbbreviation('Maggie Benson Centre', 'MBC', <LatLng>[
        LatLng(49.279180, -122.919500),
        LatLng(49.279055, -122.919550),
        LatLng(49.279125, -122.919975),
        LatLng(49.278900, -122.920045),
        LatLng(49.278830, -122.919670),
        LatLng(49.278500, -122.919355),
        LatLng(49.278250, -122.919450),
        LatLng(49.278200, -122.919100),
        LatLng(49.278475, -122.918990),
        LatLng(49.278420, -122.918625),
        LatLng(49.279020, -122.918435),
      ]),
    ); //add
    allBuildings.add(
      Buildings('Library', <LatLng>[
        LatLng(49.279915, -122.919420),
        LatLng(49.279600, -122.919550),
        LatLng(49.279360, -122.918000),
        LatLng(49.279700, -122.917880),
      ]),
    ); //add
    allBuildings.add(
      Buildings.withAbbreviation('Robert C. Brown', 'RCB', <LatLng>[
        LatLng(49.280650, -122.917050),
        LatLng(49.279740, -122.917390),
        LatLng(49.279630, -122.916625),
        LatLng(49.279865, -122.916545),
        LatLng(49.279830, -122.916340),
        LatLng(49.279910, -122.916315),
        LatLng(49.279940, -122.916475),
        LatLng(49.280075, -122.916430),
        LatLng(49.280060, -122.916340),
        LatLng(49.280575, -122.916160),
        LatLng(49.280650, -122.916650),
        LatLng(49.280630, -122.916655),
        LatLng(49.280655, -122.916820),
        LatLng(49.280615, -122.916835),
      ]),
    ); //add
  } //addBuilding

}
