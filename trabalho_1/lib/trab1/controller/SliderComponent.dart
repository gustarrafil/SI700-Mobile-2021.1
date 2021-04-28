import 'package:flutter/material.dart';

class TradeSlider extends StatefulWidget {
    @override
    _TradeSliderState createState() => _TradeSliderState();
}

class _TradeSliderState extends State<TradeSlider> {
    double _value = 0.0;

    @override
    Widget build(BuildContext context) {
        return Slider(
        value: _value,
        onChanged: (double inValue) {
            setState(() {
                _value = inValue;
            });
        },
        min: 0.0,
        max: 100.0
    );
    }
}