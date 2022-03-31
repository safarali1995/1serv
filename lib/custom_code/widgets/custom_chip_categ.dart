// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';

// Begin custom widget code
class CustomChipCateg extends StatefulWidget {
  const CustomChipCateg({
    Key key,
    this.width,
    this.height,
    this.color,
    this.categTitle,
  }) : super(key: key);

  final double width;
  final double height;
  final int color;
  final String categTitle;

  @override
  _CustomChipCategState createState() => _CustomChipCategState();
}

class _CustomChipCategState extends State<CustomChipCateg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.red[widget.color],
      ),
      child: Center(
        child: Text(widget.categTitle),
      ),
    );
  }
}
