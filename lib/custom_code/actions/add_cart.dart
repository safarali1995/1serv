// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

// Begin custom action code
Future addCart(
  String foodName,
  int foodPrice,
  String foodDescr,
  int foodQuantity,
  String foodImage,
  int foodID,
  int inputfoodID,
  int inputfoodQuan,
) async {
  // Add your function code here!
  List<dynamic> jsoncart = FFAppState().cart;

  if (jsoncart.length == 0) {
    Map<dynamic, dynamic> tempProduct = {
      'foodID': foodID,
      'foodName': foodName,
      'foodPrice': foodPrice,
      'foodDescr': foodDescr,
      'foodQuantity': foodQuantity.toInt(),
      'foodImage': foodImage,
    };
    jsoncart.add(tempProduct);
  } else if (jsoncart.length != 0) {
// Third way to iterate

    for (int i = 0; i < jsoncart.length; i++) {
      if (jsoncart[i]['foodID'] == inputfoodID) {
        jsoncart[i]['foodQuantity'] =
            jsoncart[i]['foodQuantity'] + inputfoodQuan;
      } else {
        Map<dynamic, dynamic> tempProduct = {
          'foodID': foodID,
          'foodName': foodName,
          'foodPrice': foodPrice,
          'foodDescr': foodDescr,
          'foodQuantity': foodQuantity.toInt(),
          'foodImage': foodImage,
        };
        jsoncart.add(tempProduct);
      }
    }
  }
}
