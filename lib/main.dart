import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(
      MaterialApp(
        home: Map(),
      ),
    );
//
//class Map extends StatefulWidget {
//  @override
//  _MapState createState() => _MapState();
//}
//
//class _MapState extends State<Map> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.red.shade100,
//      appBar: AppBar(
//        backgroundColor: Colors.red.shade300,
//        title: Text('SFU Interactive Map'),
//        centerTitle: true,
//      ),
//    );
//  }
//}

class Map extends StatefulWidget {
   @override
    _MapState createState() => _MapState();
}
//
class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      appBar: AppBar(
        backgroundColor: Colors.red.shade300,
        title: Text('SFU Interactive Map'),
        centerTitle: true,
      ),
    );
  }
}


