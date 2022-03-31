// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

// Begin custom action code
Future<dynamic> itemCounterState(String foodName) async {
  // Add your function code here!
  int defaultQuan = 1;
  var getItemCounter = FFAppState().itemCounterListState;
  var foundQuan = getItemCounter.firstWhere(
    (element) => element['food_name'] == foodName,
    orElse: (() => defaultQuan),
  );

  //return foundQuan == 1 ? defaultQuan : foundQuan['food_quan'];
  if (foundQuan == 1) {
    return defaultQuan;
  } else {
    return foundQuan['food_quan'];
  }
}
