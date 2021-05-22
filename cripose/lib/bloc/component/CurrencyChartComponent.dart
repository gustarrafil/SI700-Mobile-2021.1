import 'ChartValues.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SubscriberChart extends StatelessWidget {
  final List<ValuesSeries> data;

  SubscriberChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ValuesSeries, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
          domainFn: (ValuesSeries series, _) => series.dateTime.toString(),
          measureFn: (ValuesSeries series, _) => series.value,
          colorFn: (ValuesSeries series, _) => series.barColor)
    ];
    return Container(
        height: 400,
        child: Card(
          child: Column(
            children: <Widget>[
              Text(
                "Total absolut",
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ));
  }
}
