import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'CustomMenuPopup.dart';
import 'MenuChoices.dart';

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

  final LatLng _center = const LatLng(49.279075, -122.919000); //centers around convocation mall approx.

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 18.0,
            ),
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
                      return MenuChoices().choices.map((CustomMenuPopup choice) {
                        return PopupMenuItem(
                          value: choice,
                          child: Text(choice.title),
                        );
                      }).toList();
                    },
                  ),
                  //IconButton(
                  //  icon: Icon(Icons.menu),
                  //  onPressed: () {
                  //  },
                  //),
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.go, //figure out what to do with this...
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
