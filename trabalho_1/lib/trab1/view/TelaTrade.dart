import '../controller/FormTradeClass.dart';
import '../controller/FormItems.dart';
import '../controller/UserWallet.dart';
import 'package:flutter/material.dart';

class TelaTrade extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return screenTrade();
    }
}

Widget screenTrade() {
    final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
    FormTrade formTrade = new FormTrade();

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [userWallet()]
                ),
                Form(
                    key: formKey,
                    child: Column(
                        children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                    Text("Compra"),
                                    compraVendaSwitch(formTrade),
                                    Text("Venda"),
                                ],
                            ),
                            parmoedaFormField(),
                            precoFormField(),
                            qtdFormField(),
                            valorSlider(formTrade)
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


