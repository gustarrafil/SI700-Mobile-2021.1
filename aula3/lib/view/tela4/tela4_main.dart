import 'package:flutter/material.dart';
import 'package:aula01/model/complete_form.dart';

class MainTela4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainTela4State();
  }
}

class MainTela4State extends State<MainTela4> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  CompleteForm completeForm = new CompleteForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Tooltip(
              message: "Eu sou um Tooltip",
              child: Row(
                children: [myCheckbox(), Text("Sou um Checkbox")],
              ),
            ),
            Row(
              children: [mySwitch(), Text("Sou um Switch")],
            ),
            Row(
              children: [
                Text(" Slider: "),
                Expanded(child: mySlider()),
                Text("Valor: ${completeForm.sliderValue}  ")
              ],
            ),
            Row(
              children: [myRadio(1), Text("Grupo 1: Value 1")],
            ),
            Row(
              children: [myRadio(2), Text("Grupo 1: Value 2")],
            ),
            Row(
              children: [myRadio(3), Text("Grupo 1: Value 3")],
            ),
            Row(
              children: [myRadio2(1), Text("Grupo 2: Value 1")],
            ),
            Row(
              children: [myRadio2(2), Text("Grupo 2: Value 2")],
            ),
            Row(
              children: [myRadio2(3), Text("Grupo 2: Value 3")],
            ),
            myButtonSnackBar(),
            myButtonBottomSheet()
          ],
        ),
      ),
    );
  }

  Widget myCheckbox() {
    return Checkbox(
      value: completeForm.checkBoxValue,
      onChanged: (bool value) {
        setState(() {
          completeForm.checkBoxValue = value;
        });
      },
    );
  }

  Widget mySwitch() {
    return Switch(
      value: completeForm.switchValue,
      onChanged: (bool inValue) {
        setState(() {
          completeForm.switchValue = inValue;
        });
      },
    );
  }

  Widget mySlider() {
    return Slider(
        value: completeForm.sliderValue,
        onChanged: (double inValue) {
          setState(() {
            print("inValue: $inValue");
            completeForm.sliderValue = inValue;
          });
        },
        min: 0,
        max: 10);
  }

  Widget myRadio(int value) {
    return Radio(
      value: value,
      groupValue: completeForm.radioValue,
      onChanged: (int inValue) {
        setState(() {
          completeForm.radioValue = inValue;
        });
      },
    );
  }

  Widget myRadio2(int value) {
    return Radio(
      value: value,
      groupValue: completeForm.radioValue2,
      onChanged: (int inValue) {
        setState(() {
          completeForm.radioValue2 = inValue;
        });
      },
    );
  }

  Widget myButtonSnackBar() {
    return ElevatedButton(
      child: Text("Coleta Informações"),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.purple,
          duration: Duration(seconds: 1),
          content: Text("Obrigado Carolina Sancho!"),
          action: SnackBarAction(
            label: "Volte Sempre",
            onPressed: () {
              print("Funcionou");
            },
          ),
        ));
      },
    );
  }

  Widget myButtonBottomSheet() {
    return ElevatedButton(
      child: Text("Coleta Informações - Bottom Sheet"),
      onPressed: () {
        showBottomSheet(
            context: context,
            builder: (_) {
              // Daqui em diante é a tela do BottomSheet
              return Container(
                color: Colors.purple[50],
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text("Biscoito ou Bolacha?"),
                        TextButton(
                            child: Text("Biscoito com certeza"),
                            onPressed: () {
                              completeForm.bottomSheetChoice = 1;
                              Navigator.of(context).pop();
                            }),
                        TextButton(
                            child: Text("Biscoito eu acho"),
                            onPressed: () {
                              completeForm.bottomSheetChoice = 2;
                              Navigator.of(context).pop();
                            }),
                        TextButton(
                            child: Text("Bolacha com certeza"),
                            onPressed: () {
                              completeForm.bottomSheetChoice = 3;
                              Navigator.of(context).pop();
                            }),
                        TextButton(
                            child: Text("Bolacha eu acho"),
                            onPressed: () {
                              completeForm.bottomSheetChoice = 4;
                              Navigator.of(context).pop();
                            }),
                        TextButton(
                            child: Text("Nem um e nem outro"),
                            onPressed: () {
                              completeForm.bottomSheetChoice = 5;
                              Navigator.of(context).pop();
                            }),
                      ],
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              );
            });
      },
    );
  }
}
