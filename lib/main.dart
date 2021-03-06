import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'CustomMenuPopup.dart';
import 'MenuChoices.dart';
import 'BuildingPolygons.dart';
import 'package:dropdown_search/dropdown_search.dart';

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

  //map -- camera position
  static LatLng cameraLatLng = _center;
  String _searchedItem;
  void _selectSearchItem(String item) {
    setState(() {
      _searchedItem = item;

      if (_getSearchableNames().length == null) {
        return;
      }

      for (int i = 0; i < _getSearchableNames().length; i++) {
        if (_searchedItem == _getSearchableNames().elementAt(i)) {
          for (int j = 0; j < sfuBuildings.numberOfBuildings(); j++) {
            if (_getSearchableNames().elementAt(i).contains(sfuBuildings.getBuilding(j).buildingName)) {
              cameraLatLng = sfuBuildings.getBuilding(j).centre;
              break;
            }
          }
        }
      }
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: cameraLatLng,
            zoom: 19.0,
          ),
        ),
      );
    });
  }

  //markers
  List<Marker> buildingMarkers, studyMarkers, foodMarkers, washroomMarkers;

  //custom markers on map
  BitmapDescriptor pinLocationIcon,
      studyLocationIcon,
      foodLocationIcon,
      washroomLocationIcon;
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
    studyLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 3.2),
      'assets/studyspaces.png',
    );
    foodLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 3.2),
      'assets/foodMarker.png',
    );
    washroomLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 3.2),
      'assets/washroommarker.png',
    );
  }

  static final LatLng _center = const LatLng(
      49.279075, -122.919000); //centers around convocation mall approx.

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    controller.setMapStyle(_mapStyle);

    setState(
      () {
        //building markers
        buildingMarkers = [
          //WMC
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
                  "Contains: Beedie School of Business, Department of Economics",
            ),
          ),
          //MBC
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
                  "Contains: Registrar, SFU Bookstore and Spirit Shop",
            ),
          ),
          //library
          Marker(
            markerId: MarkerId(sfuBuildings.getBuilding(2).buildingName),
            position: sfuBuildings.getBuilding(2).centre,
            icon: pinLocationIcon,
            infoWindow: InfoWindow(
              title: sfuBuildings.getBuilding(2).buildingName,
              snippet: "You can borrow laptops here!",
            ),
          ),
          //RCB
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
          //AQ
          Marker(
            markerId: MarkerId(sfuBuildings.getBuilding(4).buildingName),
            position: sfuBuildings.getBuilding(4).centre,
            icon: pinLocationIcon,
            infoWindow: InfoWindow(
              title: sfuBuildings.getBuilding(4).buildingName + " (" + sfuBuildings.getBuilding(4).abbreviation + ")",
              snippet: "Contains: SFU Art Gallery"
            ),
          ),
        ];
        //study spaces markers
        studyMarkers = [
          //in WMC
          Marker(
            markerId: MarkerId('wmc1'),
            position: LatLng(49.279675, -122.922200),
            icon: studyLocationIcon,
            infoWindow: InfoWindow(
              title: "Computer Lab (2F)",
            ),
          ),
          Marker(
            markerId: MarkerId('wmc2'),
            position: LatLng(49.279850, -122.922225),
            icon: studyLocationIcon,
            infoWindow: InfoWindow(
              title: "Study Tables with Outlets (1F)",
            ),
          ),
          Marker(
            markerId: MarkerId('wmc3'),
            position: LatLng(49.279710, -122.921250),
            icon: studyLocationIcon,
            infoWindow: InfoWindow(
              title: "Study Tables with Outlets (1F)",
            ),
          ),
          //Library
          Marker(
            markerId: MarkerId('library'),
            position: LatLng(49.279600, -122.918675),
            icon: studyLocationIcon,
            infoWindow: InfoWindow(
              title: "Check out the different study areas on different floors!",
            ),
          ),
          //in MBC
          Marker(
            markerId: MarkerId('mbc'),
            position: LatLng(49.278775, -122.919100),
            icon: studyLocationIcon,
            infoWindow: InfoWindow(
              title: "Study Tables with Outlets (1F)",
            ),
          ),
          //in RCB
          Marker(
            markerId: MarkerId('rcb'),
            position: LatLng(49.279800, -122.916950),
            icon: studyLocationIcon,
            infoWindow: InfoWindow(
              title: "Study Tables with Outlets (Below Images Theatre)",
            ),
          ),
        ];
        //food area markers
        foodMarkers = [
          //in WMC
          Marker(
            markerId: MarkerId('tims1'),
            position: LatLng(49.279725, -122.921900),
            icon: foodLocationIcon,
            infoWindow: InfoWindow(
              title: "Tim Hortons (2F)",
            ),
          ),
          Marker(
            markerId: MarkerId('starbucks1'),
            position: LatLng(49.279550, -122.920800),
            icon: foodLocationIcon,
            infoWindow: InfoWindow(
              title: "Starbucks (3F)",
            ),
          ),
          //in MBC
          Marker(
            markerId: MarkerId('mbc foodcourt'),
            position: LatLng(49.278515, -122.918750),
            icon: foodLocationIcon,
            infoWindow: InfoWindow(
                title: "MBC Food Court (2F)",
                snippet: "Gawon Korean Food, Guadalupe, Curry"),
          ),
          Marker(
            markerId: MarkerId('the study'),
            position: LatLng(49.278575, -122.918750),
            icon: foodLocationIcon,
            infoWindow: InfoWindow(
              title: "The Study (3F)",
            ),
          ),
          Marker(
            markerId: MarkerId('renaissance coffee1'),
            position: LatLng(49.278800, -122.918715),
            icon: foodLocationIcon,
            infoWindow: InfoWindow(
              title: "Renaissance Coffee (3F)",
            ),
          ),
          //in RCB
          Marker(
            markerId: MarkerId('junction'),
            position: LatLng(49.279425, -122.917350),
            icon: foodLocationIcon,
            infoWindow: InfoWindow(
                title: "Junction (1F)",
                snippet: "burgers and fries! -special tuesday deals-"),
          ),
          Marker(
            markerId: MarkerId('qoola'),
            position: LatLng(49.279100, -122.917450),
            icon: foodLocationIcon,
            infoWindow: InfoWindow(
              title: "Qoola (1F)",
            ),
          ),
          Marker(
            markerId: MarkerId('jugo juice'),
            position: LatLng(49.279425, -122.916000),
            icon: foodLocationIcon,
            infoWindow: InfoWindow(
              title: "Jugo Juice (3F)",
            ),
          ),
          Marker(
            markerId: MarkerId('renaissance coffee2'),
            position: LatLng(49.279400, -122.915800),
            icon: foodLocationIcon,
            infoWindow: InfoWindow(
              title: "Renaissance Coffee (3F)",
            ),
          ),
          Marker(
            markerId: MarkerId('mackenzie cafe'),
            position: LatLng(49.278675, -122.915700),
            icon: foodLocationIcon,
            infoWindow: InfoWindow(
              title: "Mackenzie Cafe (3F)",
              snippet: "Subway, Pizza, Sushi, Coffee, Baked goods, Other drinks"
            ),
          ),
        ];
        //washroom markers
        washroomMarkers = [
          //in WMC
          Marker(
            markerId: MarkerId('washroom1'),
            position: LatLng(49.279750, -122.922500),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Women's Washroom (3F)",
            ),
          ),
          Marker(
            markerId: MarkerId('washroom2'),
            position: LatLng(49.279740, -122.922400),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Men's Washroom (2F)",
            ),
          ),
          Marker(
            markerId: MarkerId('washroom3'),
            position: LatLng(49.279635, -122.921625),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Women's Washroom (3F)",
            ),
          ),
          Marker(
            markerId: MarkerId('washroom4'),
            position: LatLng(49.2795760, -122.921300),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Men's Washroom (3F)",
            ),
          ),
          Marker(
            markerId: MarkerId('washroom5'),
            position: LatLng(49.2795730, -122.921100),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Women's Washroom (2F)",
            ),
          ),
          Marker(
            markerId: MarkerId('washroom6'),
            position: LatLng(49.2795735, -122.921150),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Handicapped Washroom (2F)",
            ),
          ),
          //in MBC
          Marker(
            markerId: MarkerId('washroom7'),
            position: LatLng(49.278800, -122.919075),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Washrooms (M/F) (2F)",
            ),
          ),
          //in the Library
          Marker(
            markerId: MarkerId('washroom8'),
            position: LatLng(49.279480, -122.918300),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Men's Washroom (Most Floors)",
            ),
          ),
          Marker(
            markerId: MarkerId('washroom9'),
            position: LatLng(49.279575, -122.918270),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Women's Washroom (Most Floors)",
            ),
          ),
          Marker(
            markerId: MarkerId('washroom10'),
            position: LatLng(49.279610, -122.919200),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Men's Washroom (Most Floors)",
            ),
          ),
          Marker(
            markerId: MarkerId('washroom11'),
            position: LatLng(49.279700, -122.919180),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Women's Washroom (Most Floors)",
            ),
          ),
          //in RCB
          Marker(
            markerId: MarkerId('washroom12'),
            position: LatLng(49.279725, -122.916825),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Women's Washroom (1F)",
            ),
          ),
          Marker(
            markerId: MarkerId('washroom13'),
            position: LatLng(49.279750, -122.917000),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Men's Washroom (1F)",
            ),
          ),
          //in AQ
          Marker(
            markerId: MarkerId('washroom14'),
            position: LatLng(49.279325, -122.916100),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Washrooms (M/F) (3F)",
            ),
          ),
          Marker(
            markerId: MarkerId('washroom15'),
            position: LatLng(49.278350, -122.916500),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Women's Washroom (3F)",
            ),
          ),
          Marker(
            markerId: MarkerId('washroom16'),
            position: LatLng(49.278340, -122.916425),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Men's Washroom (3F)",
            ),
          ),
          Marker(
            markerId: MarkerId('washroom17'),
            position: LatLng(49.278475, -122.917350),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Women's Washroom (3F)",
            ),
          ),
          Marker(
            markerId: MarkerId('washroom18'),
            position: LatLng(49.278465, -122.917300),
            icon: washroomLocationIcon,
            infoWindow: InfoWindow(
              title: "Men's Washroom (3F)",
            ),
          ),
        ];

        _markers.addAll(buildingMarkers);
      },
    );
  }

  void _selectMenuOption(CustomMenuPopup choice) {
    setState(() {
      _selectedChoices = choice;

      if (_selectedChoices.title == MenuChoices().choices[0].title) {
        _markers.removeAll(foodMarkers);
        _markers.removeAll(studyMarkers);
        _markers.removeAll(washroomMarkers);
        _markers.addAll(buildingMarkers);
      } else if (_selectedChoices.title == MenuChoices().choices[1].title) {
        _markers.removeAll(buildingMarkers);
        _markers.removeAll(studyMarkers);
        _markers.removeAll(washroomMarkers);
        _markers.addAll(foodMarkers);
      } else if (_selectedChoices.title == MenuChoices().choices[2].title) {
        _markers.removeAll(foodMarkers);
        _markers.removeAll(studyMarkers);
        _markers.removeAll(buildingMarkers);
        _markers.addAll(washroomMarkers);
      } else if (_selectedChoices.title == MenuChoices().choices[3].title) {
        _markers.removeAll(buildingMarkers);
        _markers.removeAll(foodMarkers);
        _markers.removeAll(washroomMarkers);
        _markers.addAll(studyMarkers);
      }
    });
  }

  List<String> _getSearchableNames() {
    List<String> buildingNames, foodPlacesNames;

    buildingNames = [
      "West Mall Centre (WMC)",
      "Library",
      "Maggie Benston Centre (MBC)",
      "Robert C. Brown (RCB)",
    ];
    foodPlacesNames = [
      "Tim Hortons",
      "Starbucks",
      "Renaissance Coffee",
    ];

    if (_selectedChoices.title == MenuChoices().choices[0].title) {
      return buildingNames;
    } else if (_selectedChoices.title == MenuChoices().choices[1].title) {
      return foodPlacesNames;
    }

    return null;
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
                    child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      showClearButton: true,
                      showSelectedItem: true,
                      showSearchBox: true,
                      items: _getSearchableNames(),
                      label: "Finder",
                      hint: "Name of the Place",
                      onChanged: _selectSearchItem,
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
