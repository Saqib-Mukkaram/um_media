import 'package:flutter/material.dart';

class TalentCardArtisan extends StatelessWidget {
  final String src;
  final String text;
  final bool netImg;
  const TalentCardArtisan({
    required this.src,
    required this.text,
    this.netImg = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          color: Colors.white,
          // color: Color.fromARGB(28, 0, 0, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image.asset(AppConstants.img_photography)
                netImg
                    ? Image.network(
                        src,
                        width: 150,
                        height: 200,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        src,
                        width: 150,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    text.toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      // backgroundColor: const Color.fromARGB(96, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
