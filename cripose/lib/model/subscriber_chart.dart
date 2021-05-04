import 'package:cripose/model/subscriber_series.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SubscriberChart extends StatelessWidget {
  final List<SubscriberSeries> data;

  SubscriberChart({@required this.data});

@override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
        id: "Subscribers",
        data: data,
        domainFn: (SubscriberSeries series, _) => series.year,
        measureFn: (SubscriberSeries series, _) => series.subscribers,
        colorFn: (SubscriberSeries series, _) => series.barColor
      )
    ];
return Container(
      height: 400,
      child: Card(
          child: Column(
            children: <Widget>[
              Text(
                "valor absoluto",
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
      ),
    ));
  }
}