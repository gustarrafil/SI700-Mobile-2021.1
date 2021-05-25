// import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ValuesSeries {
  // final String dateTime;
  final int value;
  final charts.Color barColor;

  ValuesSeries(
      {
      // @required this.dateTime,
      @required this.value,
      @required this.barColor});
}
