import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int cartComponentVisibility() {
  // Add your function code here!
  var jsonLength = FFAppState().itemCounterListState;
  return jsonLength.length;
}

int getQuantityFoodItem(String foodName) {
  // Add your function code here!
  int defaultQuan = 1;
  var getItemCounter = FFAppState().itemCounterListState;
  var foundQuan = getItemCounter.firstWhere(
    (element) => element['food_name'] == foodName,
    orElse: (() => defaultQuan),
  );

  return foundQuan == 1 ? defaultQuan : foundQuan['food_quan'];
}

int getTotalCostFoodItem(String foodName) {
  // Add your function code here!
  var defaultQuan = '';
  var getItemCounter = FFAppState().itemCounterListState;
  var foundQuan = getItemCounter.firstWhere(
    (element) => element['food_name'] == foodName,
    orElse: (() => defaultQuan),
  );

  return foundQuan == defaultQuan ? defaultQuan : foundQuan['food_price'];
}
