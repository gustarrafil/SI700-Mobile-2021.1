import '../controller/SliderComponent.dart';
import 'package:flutter/material.dart';

class BuyForm extends StatelessWidget {
  final GlobalKey<FormState> buyForm = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: buyForm,
      child: Column(
        children: [
          parmoedaFormField(),
          precoFormField(),
          qtdFormField(),
          TradeSlider()
        ],
      ),
    );
  }
}

Widget parmoedaFormField() {
  return TextFormField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(labelText: "Currency pair"),
  );
}

Widget precoFormField() {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(labelText: "Buy price"),
  );
}

Widget qtdFormField() {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(labelText: "Quantity"),
  );
}
