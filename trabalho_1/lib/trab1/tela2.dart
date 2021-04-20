import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return presentationScreen();
    }
}

Widget presentationScreen() {
    final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
            children: [
                Row(
                    children: [
                        Text("\$100"),
                    ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                                Text("Compra"),
                                Switch(
                                    value: true,
                                    onChanged: (on) {}
                                ),
                                Text("Venda"),
                            ],
                        ),
                    ],
                ),
                Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 50),
                                child: Column(
                                    children: [
                                        parmoedaFormField(),
                                        precoFormField(),
                                        qtdFormField(),
                                        Slider(value: 1, onChanged: (double) {}),
                                    ],
                                ),
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                child: Text("GATILHO")
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                child: Text("FINALIZAR")
                            ),
                        ],
                    )
                )
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
