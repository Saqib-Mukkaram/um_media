import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBarButtons extends StatelessWidget {
  final Icon buttonIcon;

  final void Function()? onPressed;

  final Widget label;

  final ButtonStyle style;

  const SideBarButtons({
    required this.buttonIcon,
    required this.onPressed,
    required this.label,
    required this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
          style: style,
          onPressed: onPressed,
          icon: Icon(
            Icons.logout_outlined,
          ),
          label: label),
    );
  }
}
