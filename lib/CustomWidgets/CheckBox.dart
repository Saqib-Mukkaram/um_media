import 'package:flutter/material.dart';

class CheckBoxCustom extends StatefulWidget {
  const CheckBoxCustom({super.key});

  @override
  State<CheckBoxCustom> createState() => _CheckBoxCustomState();
}

class _CheckBoxCustomState extends State<CheckBoxCustom> {
  var isChecked;
  @override
  void initState() {
    isChecked = false;
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
       activeColor: Colors.black,
        value: isChecked,
        onChanged: (onChanged) {
          setState(() {
            isChecked = onChanged;
          });
        });
  }
}
