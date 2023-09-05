import 'package:flutter/material.dart';

class TalentCard extends StatelessWidget {
  final String src;
  final String text;
  final bool netImg;
  const TalentCard({
    required this.src,
    required this.text,
    this.netImg = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 8),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          color: Color.fromARGB(28, 0, 0, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image.asset(AppConstants.img_photography)
                netImg
                    ? Image.network(
                        src,
                        width: 200,
                        height: 270,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        src,
                        width: 200,
                        height: 270,
                        fit: BoxFit.fill,
                      ),
                Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    // backgroundColor: const Color.fromARGB(96, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
