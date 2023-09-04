import 'package:flutter/material.dart';
import 'LabelText.dart';

class TextWithDividers extends StatelessWidget {
  final String text;
  final double dividerThickness;
  final Color dividerColor;
  final TextStyle textStyle;
  final double startIndent;
  final double endIndent;

  const TextWithDividers({
    Key? key,
    required this.text,
    this.dividerThickness = 1.0,
    this.dividerColor = Colors.grey,
    this.startIndent = 16.0,
    this.endIndent = 16.0,
    this.textStyle = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Divider(
            indent: startIndent,
            color: dividerColor,
            thickness: dividerThickness,
          ),
        ),
        LabelText(
          labelText: text,
          paddingbottom: 0,
          paddingleft: 5,
          paddingright: 5,
          paddingtop: 0,
        ),
        Expanded(
          child: Divider(
            endIndent: endIndent,
            color: dividerColor,
            thickness: dividerThickness,
          ),
        ),
      ],
    );
  }
}
