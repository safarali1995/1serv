// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

// Begin custom action code
Future incrementFoodItem(
  int foodQuantity,
  String foodName,
) async {
  // Add your function code here!
  int defaultQuan = 1;
  var getCart = FFAppState().cart;
  var foundQuan = getCart.firstWhere(
    (element) => element['foodName'] == foodName,
    orElse: (() {
      return defaultQuan;
    }),
  );

  if (foundQuan != 1) {
    var quan = foundQuan['foodQuantity'] + 1;
    return foundQuan['foodQuantity'] = quan;
  } else {
    return print("Nothing to increment");
  }
}
