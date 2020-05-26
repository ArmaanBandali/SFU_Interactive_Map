import 'package:flutter/material.dart';

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
