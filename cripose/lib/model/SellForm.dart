import '../controller/SliderComponent.dart';
import 'package:flutter/material.dart';

class SellForm extends StatelessWidget {
  final GlobalKey<FormState> sellForm = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: sellForm,
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
    decoration: InputDecoration(labelText: "Sell price"),
  );
}

Widget qtdFormField() {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(labelText: "Quantity"),
  );
}
