import '../model/Wallet.dart';
import 'package:flutter/material.dart';

class TradeSlider extends StatefulWidget {
  @override
  _TradeSliderState createState() => _TradeSliderState();
}

class _TradeSliderState extends State<TradeSlider> {
  double _value = 0.0;

  calculatePercentage(double inValue) {
    double wallet = (new Wallet()).value;
    return (inValue * 100) / wallet;
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
        activeColor: Colors.blueGrey[900],
        value: _value,
        onChanged: (double inValue) {
          setState(() {
            _value = inValue;
            // calculatePercentage(inValue);
          });
        },
        min: 0.0,
        max: 100.0);
  }
}
