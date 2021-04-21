import './FormTradeClass.dart';
import 'package:flutter/material.dart';

Widget parmoedaFormField() {
    return TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: "Par da moeda"
        ),
    );
}

Widget precoFormField() {
    return TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: "Preço de [compra/venda]"
        ),
    );
}

Widget qtdFormField() {
    return TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: "Quantidade"
        ),
    );
}


Widget compraVendaSwitch(FormTrade formTrade) {
    return Switch(
        value: formTrade.switchValue,
        onChanged: (bool inValue) {
            // setState(() {
            //     formTrade.switchValue = inValue;
            // });
        }
    );
}

Widget valorSlider(FormTrade formTrade) {
    return Slider(
        value: formTrade.sliderValue,
        onChanged: (double inValue) {
            // setState(() {
            // print("$inValue");
            // formTrade.sliderValue = inValue;
            // });
        },
        min: 0,
        max: 100
    );
}
