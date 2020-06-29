import 'dart:core';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Buildings {
  //Base building info
  String buildingName;
  String abbreviation;
  LatLng centre;
  List<LatLng> buildingCoords;
  Buildings(this.buildingName, this.buildingCoords, this.centre);
  Buildings.withAbbreviation(
      this.buildingName, this.abbreviation, this.buildingCoords, this.centre);
}

class AllBuildings {
  List<Buildings> allBuildings = [];

  AllBuildings() {
    allBuildings.add(
      Buildings.withAbbreviation(
        'West Mall Centre',
        'WMC',
        <LatLng>[
          //Example for adding polygon coordinates and id through constructor
          LatLng(49.279700, -122.922640),
          LatLng(49.280010, -122.922525),
          LatLng(49.279780, -122.920965),
          LatLng(49.279465, -122.921075),
        ],
        LatLng(49.279700, -122.921790),
      ),
    ); //add
    allBuildings.add(
      Buildings.withAbbreviation(
        'Maggie Benston Centre',
        'MBC',
        <LatLng>[
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
        ],
        LatLng(49.278775, -122.919100),
      ),
    ); //add
    allBuildings.add(
      Buildings(
        'Library',
        <LatLng>[
          LatLng(49.279915, -122.919420),
          LatLng(49.279600, -122.919550),
          LatLng(49.279360, -122.918000),
          LatLng(49.279700, -122.917880),
        ],
        LatLng(49.279600, -122.918675),
      ),
    ); //add
    allBuildings.add(
      Buildings.withAbbreviation(
        'Robert C. Brown',
        'RCB',
        <LatLng>[
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
        ],
        LatLng(49.280100, -122.916825),
      ),
    ); //add
    allBuildings.add(
      Buildings.withAbbreviation(
        "Academic Quadrangle",
        "AQ",
        <LatLng>[
          LatLng(49.279375, -122.915425),
          LatLng(49.279660, -122.917220),
          LatLng(49.278465, -122.917695),
          LatLng(49.278175, -122.915875),
          LatLng(49.279225, -122.915480),
          LatLng(49.279261, -122.915708),
          LatLng(49.278350, -122.916070),
          LatLng(49.278560, -122.917400),
          LatLng(49.279475, -122.917045),
          LatLng(49.279225, -122.915480),
        ],
        LatLng(49.278350, -122.916700),
      ),
    ); //add
  } //addBuilding

}
