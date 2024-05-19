import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';

class RentalsBar extends StatelessWidget {
  const RentalsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Text(
            "Rent Equipment".toUpperCase(),
            style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios_outlined
              ,
          color: Colors.white,
        )
      ],
    );
  }
}