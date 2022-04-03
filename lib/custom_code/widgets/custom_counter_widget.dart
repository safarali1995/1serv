// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:counter/counter.dart';

class CustomCounterWidget extends StatefulWidget {
  const CustomCounterWidget({
    Key key,
    this.width,
    this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  _CustomCounterWidgetState createState() => _CustomCounterWidgetState();
}

class _CustomCounterWidgetState extends State<CustomCounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Counter(
          min: 0,
          max: 10,
          bound: 3,
          step: 1,
          onValueChanged: print,
        ),
      ),
    );
  }
}
