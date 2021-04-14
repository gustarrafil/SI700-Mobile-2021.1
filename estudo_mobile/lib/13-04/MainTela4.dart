import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/complete_form.dart';

// stateful pra colocar que ele depende de outras infos
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
            Row(
              children: [myCheckbox(), Text("sou um checkbox")],
            ),
            Row(
              children: [mySwitch(), Text("sou um switch")],
            ),
            Row(
              children: [
                mySlider(),
              ],
            ),
            Row(
              children: [
                myRadio(1),
                Text("primeiro")
              ],
            ),
            Row(
              children: [
                myRadio(2),
                Text("segundo")
              ],
            ),
            Row(
              children: [
                myRadio(3),
                Text("terceiro")
              ],
            ),
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
        });
  }

  Widget mySwitch() {
    return Switch(
        value: completeForm.switchValue,
        onChanged: (bool inValue) {
          setState(() {
            completeForm.switchValue = inValue;
          });
        });
  }

  Widget mySlider() {
    return Slider(
        value: completeForm.sliderValue,
        onChanged: (double inValue) {
          setState(() {
            print("$inValue");
            completeForm.sliderValue = inValue;
          });
        },
        min: 0,
        max: 20);
  }

  Widget myRadio(int value) {
    return Radio(
        value: value,
        groupValue: completeForm.radioValue,
        onChanged: (int inValue) {
          setState(() {
            completeForm.radioValue = inValue;
          });
        });
  }
}
