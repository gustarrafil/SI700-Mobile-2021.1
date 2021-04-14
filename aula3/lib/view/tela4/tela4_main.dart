import 'package:aula3/model/complete_form.dart';
import 'package:aula3/view/tela3/tela3_main.dart';
import 'package:flutter/material.dart';

class MainTela4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainTela4State();
  }
}

class MainTela4State extends State<MainTela4> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  bool checkBoxValue = false;
  CompleteForm completeForm = new CompleteForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            // Tooltip(
            // message: "Eu sou um tooltip"
            // child: Row(
            // children: [myCheckBox(), Text("Sou um checkbox")],
            // ),
            // ),
            Row(children: [mySwitch(), Text('Switch')]),
            Row(children: [mySlider(), Text("Slider")]),
            Row(children: [myRadio(1), Text("Radio 1")]),
            Row(children: [myRadio(2), Text("Radio 1")]),
            Row(children: [myRadio(3), Text("Radio 1")]),
            Divider(),
            Row(children: [myRadio2(1), Text("Radio 1")]),
            Row(children: [myRadio2(2), Text("Radio 1")]),
            Row(children: [myRadio2(3), Text("Radio 1")]),
            Center(child: Row(children: [myButtonSnackBar(), Text("Radio 1")])),
            Center(
                child: Row(children: [myButtonBottomSheet(), Text("Radio 1")])),
          ],
        ),
      ),
    );
  }

  Widget myCheckBox() {
    return Checkbox(
      value: completeForm.checkBoxValue,
      onChanged: (bool inValue) {
        setState(() {
          completeForm.checkBoxValue = inValue;
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
          completeForm.sliderValue = inValue;
        });
      },
      min: 0,
      max: 10,
    );
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
    return RaisedButton(
      child: Text("Button to Snack"),
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.purple,
            action: SnackBarAction(
                label: "Volte sempre",
                onPressed: () {
                  print("funcionou");
                }),
            content: Text("Obrigado por ser snack")));
      },
    );
  }

  Widget myButtonBottomSheet() {
    return RaisedButton(
        child: Text("Abrindo bottom sheet"),
        onPressed: () {
          showBottomSheet(
              context: context,
              builder: (_) {
                // Daqui em diante eh a tela do bottom sheet
                return Container(
                  color: Colors.grey,
                  child: Row(
                    children: [
                      Column(
                        children: [Text("Voce tem certeza dessa ordem ?")],
                        mainAxisSize: MainAxisSize.min,
                      ),
                      FlatButton(
                          child: Text("Biscoito"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      FlatButton(
                          child: Text("Bolacha"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })
                    ],
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                );
              });
        });
  }
}
