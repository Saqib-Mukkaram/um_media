import 'package:flutter/material.dart';
import 'package:um_media/AppConstants.dart';

class IconInputField extends StatefulWidget {
  final String placeholderText;
  final TextEditingController fieldController;
  final double width;
  final double height;
  final double fieldPaddingleft;
  final double fieldPaddingright;
  final double suffixIconImageWidth;
  final double suffixIconImageHeight;
  final double sufficIconPadding;
  final Widget? suffixIcon; // Updated to accept both icon and image
  final Widget? prefixIcon; // Updated to accept both icon and image
  final bool obscureText;
  final TextInputType keyboardType;

  IconInputField({
    Key? key,
    required this.placeholderText,
    required this.fieldController,
    this.width = double.infinity,
    this.fieldPaddingleft = 16,
    this.fieldPaddingright = 16,
    this.suffixIcon,
    this.height = 60,
    this.prefixIcon,
    this.suffixIconImageHeight = 20,
    this.suffixIconImageWidth = 30,
    this.sufficIconPadding = 8,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<IconInputField> createState() => _IconInputFieldState();
}

class _IconInputFieldState extends State<IconInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        widget.fieldPaddingleft,
        0,
        widget.fieldPaddingright,
        0,
      ),
      child: Container(
        width: widget.width,
        height: widget.height,
        child: TextFormField(
          style: TextStyle(),
          controller: widget.fieldController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This is a required field.';
            } else {
              return null;
            }
          },
          cursorColor: Colors.black,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppConstants.subTextGrey),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            fillColor: Colors.white,
            hintText: widget.placeholderText,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
            ),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
          ),
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
        ),
      ),
    );
  }
}
