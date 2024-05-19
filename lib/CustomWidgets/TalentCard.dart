import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:um_media/AppConstants.dart';

import '../Controller/ShimmerController.dart';

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
        child: LayoutBuilder(
          builder: (con, constraints) {
            return Card(
              elevation: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Container(
                  constraints: BoxConstraints(maxHeight: constraints.maxHeight),
                  color: Colors.white,
                  // color: Color.fromARGB(28, 0, 0, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Image.asset(AppConstants.img_photography)
                        netImg
                            ? CachedNetworkImage(
                                imageUrl: src,
                                width: 125,
                                height: 150,
                                fit: BoxFit.fill,
                                // progressIndicatorBuilder:
                                //     (context, url, downloadProgress) =>
                                //         Padding(
                                //           padding: EdgeInsets.fromLTRB(32,64,32,64),
                                //           child: CircularProgressIndicator(
                                //               value: downloadProgress.progress,
                                //               color: AppConstants.siteSubColor
                                //               ,),
                                //         ),
                                // errorWidget: (context, url, error) =>
                                //     Icon(Icons.error),
                                placeholder: (context, url) =>
                                    ShimmerController.shimmerList(),
                              )
                            : Image.network(
                                src,
                                width: 125,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            text.toUpperCase(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              // backgroundColor: const Color.fromARGB(96, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            );
          },
        ));
  }
}
