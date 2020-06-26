import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sfuinteractivemap/BuildingCoordinates.dart';
import 'CustomMenuPopup.dart';
import 'MenuChoices.dart';
import 'BuildingPolygons.dart';

void main() => runApp(
      MaterialApp(
        home: Map(),
      ),
    );

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController mapController;
  CustomMenuPopup _selectedChoices = MenuChoices().choices[0];
  MyBuildings sfuBuildings = new MyBuildings();
  String _mapStyle;

  //custom markers on map
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};

  void initState() {
    super.initState();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });

    setCustomMapPin();
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 3.2),
      'assets/icons8-marker-100.png',
    );
  }

  final LatLng _center = const LatLng(
      49.279075, -122.919000); //centers around convocation mall approx.

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    controller.setMapStyle(_mapStyle);

    setState(
      () {
        _markers.add(
          Marker(
            markerId: MarkerId(sfuBuildings.getBuilding(0).buildingName),
            position: sfuBuildings.getBuilding(0).centre,
            icon: pinLocationIcon,
            infoWindow: InfoWindow(
              title: sfuBuildings.getBuilding(0).buildingName +
                  ' (' +
                  sfuBuildings.getBuilding(0).abbreviation +
                  ')',
              snippet:
                  "Contains: Beedie School of Business, Department of Economics, MATHWEST",
            ),
          ),
        ); // Add Marker
        _markers.add(
          Marker(
            markerId: MarkerId(sfuBuildings.getBuilding(1).buildingName),
            position: sfuBuildings.getBuilding(1).centre,
            icon: pinLocationIcon,
            infoWindow: InfoWindow(
              title: sfuBuildings.getBuilding(1).buildingName +
                  " (" +
                  sfuBuildings.getBuilding(1).abbreviation +
                  ")",
              snippet:
                  "Contains: Registrar and Information Services, SFU Bookstore and Spirit Shop",
            ),
          ),
        ); // Add Marker
        _markers.add(
          Marker(
            markerId: MarkerId(sfuBuildings.getBuilding(2).buildingName),
            position: sfuBuildings.getBuilding(2).centre,
            icon: pinLocationIcon,
            infoWindow: InfoWindow(
              title: sfuBuildings.getBuilding(2).buildingName,
              snippet: "You can borrow laptops here!",
            ),
          ),
        ); // Add Marker
        _markers.add(
          Marker(
            markerId: MarkerId(sfuBuildings.getBuilding(3).buildingName),
            position: sfuBuildings.getBuilding(3).centre,
            icon: pinLocationIcon,
            infoWindow: InfoWindow(
              title: sfuBuildings.getBuilding(3).buildingName +
                  " (" +
                  sfuBuildings.getBuilding(3).abbreviation +
                  ")",
              snippet: "Contains: Images Theatre",
            ),
          ),
        );
      },
    );
  }

  void _selectMenuOption(CustomMenuPopup choice) {
    setState(() {
      _selectedChoices = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      appBar: AppBar(
        backgroundColor: Colors.red.shade300,
        title: Text('SFU Interactive Map'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            //buildingsEnabled: false,
            compassEnabled: true,
            markers: _markers,
            onMapCreated: _onMapCreated,
            rotateGesturesEnabled: true,
            minMaxZoomPreference: MinMaxZoomPreference(
                16.0, 19.0), //sets bounds for zoom of the map
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 18.0,
            ),
            polygons: sfuBuildings.buildingSet(),
          ),
          Positioned(
            top: 10,
            right: 15,
            left: 15,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[300],
              ),
              child: Row(
                children: <Widget>[
                  PopupMenuButton(
                    elevation: 3.2,
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    onSelected: _selectMenuOption,
                    itemBuilder: (BuildContext context) {
                      return MenuChoices()
                          .choices
                          .map((CustomMenuPopup choice) {
                        return PopupMenuItem(
                          value: choice,
                          child: Text(choice.title),
                        );
                      }).toList();
                    },
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction
                          .go, //figure out what to do with this...
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: "Search...",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
