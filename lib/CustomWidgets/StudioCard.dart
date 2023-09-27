
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:um_media/AppConstants.dart';


class StudioCard extends StatelessWidget {
  final String src;
  final String text;
  final bool netImg;
  
  const StudioCard({
    required this.src,
    required this.text,
    this.netImg = true,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 8),
      child: Card(
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
                      ? CachedNetworkImage(
                          imageUrl: src,
                          width: 350,
                          height: 270,
                          fit: BoxFit.fill,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(32,64,32,64),
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress,
                                        color: AppConstants.siteSubColor
                                        ,),
                                  ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        )
                      : Image.network(
                          src,
                          width: 350,
                          height: 270,
                          fit: BoxFit.fill,
                        ),
                  Text(
                    text.toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      // backgroundColor: const Color.fromARGB(96, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}