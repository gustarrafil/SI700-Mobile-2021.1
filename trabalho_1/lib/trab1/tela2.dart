import 'package:flutter/material.dart';

class TelaTrade extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return screenTrade();
    }
}

Widget screenTrade() {
    final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        Text(
                            "\$100",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30
                            ),
                        ),
                    ],
                ),
                Form(
                    key: formKey,
                    child: Column(
                        children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                    Text("Compra"),
                                    mySwitch(),
                                    Text("Venda"),
                                ],
                            ),
                            parmoedaFormField(),
                            precoFormField(),
                            qtdFormField(),
                            mySlider()
                        ],
                    ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        ElevatedButton(
                            onPressed: () {},
                            child: Text("GATILHO")
                        ),
                    ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        ElevatedButton(
                            onPressed: () {},
                            child: Text("FINALIZAR")
                        ),
                    ],
                ),
            ]
        ),
    );
}


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


Widget mySwitch() {
    return Switch(
        value: true,
        onChanged: (bool inValue) {}
    );
}
Widget mySlider() {
    return Slider(
        value: 50,
        onChanged: (double inValue) {},
        min: 0,
        max: 100
    );
}