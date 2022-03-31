// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

// Begin custom action code
Future<int> calculateCartTotal() async {
  // Add your function code here!
  int total = FFAppState().totalPriceFinal;
  var cartjson = FFAppState().cartOnlyPrices;
  for (var x = 0; x < cartjson.length; x++) {
    total += cartjson[x];
  }
  return total;
}
