// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

// Begin custom action code
Future addToCartCA(
  BuildContext context,
  int foodID,
  String foodName,
  int foodQuantity,
  int foodPrice,
  String foodImage,
) async {
  // Add your function code here!
  // Add your function code here!
  int defaultQuan = 1;
  var getCart = FFAppState().cart;
  var foundQuan = getCart.firstWhere(
    (element) => element['foodName'] == foodName,
    orElse: (() {
      return defaultQuan;
    }),
  );

  if (foundQuan == 1) {
    Map<String, dynamic> tempProduct = {
      'foodID': foodID,
      'foodName': foodName,
      'foodImage': foodImage,
      'foodPrice': foodPrice,
      'foodQuantity': foodQuantity,
    };
    return FFAppState().cart.add(tempProduct);
  } else {
    var quan = foundQuan['foodQuantity'] + foodQuantity;
    return foundQuan['foodQuantity'] = quan;
  }
}
