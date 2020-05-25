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
    return SafeArea(
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
