import '../bloc/component/CurrencyChartComponent.dart';
import '../bloc/component/ChartValues.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartView extends StatelessWidget {
  final List<ValuesSeries> data = [
    ValuesSeries(
      // dateTime: "12",
      value: 65,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    ValuesSeries(
      //   dateTime: "13",
      value: 60,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    ValuesSeries(
      //   dateTime: "14",
      value: 58,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    ValuesSeries(
      // dateTime: "15",
      value: 67,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    ValuesSeries(
      //   dateTime: "16",
      value: 40,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    ValuesSeries(
      // dateTime: "17",
      value: 35,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    ValuesSeries(
      // dateTime: "18",
      value: 70,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    ValuesSeries(
      // dateTime: "19",
      value: 76,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SubscriberChart(
      data: data,
    );
  }
}
