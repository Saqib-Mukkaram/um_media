import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/StudioController.dart';
import 'package:um_media/CustomWidgets/StudioCard.dart';
import 'package:um_media/Views/Studio/StudioView.dart';

class Studios extends StatefulWidget {
  const Studios({super.key});

  @override
  State<Studios> createState() => _StudiosState();
}

class _StudiosState extends State<Studios> {
  final StudioController _controller = Get.put(StudioController());
  var studiourl = AppConstants.img_studio;
  var studioitem = [
    "Music Studio",
    "Muffled Studio",
    "Music Instruments",
    "Padded Room"
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 345,
          child: FutureBuilder(
            future: _controller.getStudioList(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(10.0),
                  shrinkWrap: true, // Set shrinkWrap to true
                  itemCount: _controller.studiosList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var studio = _controller.studiosList.elementAt(index);
                    return InkWell(
                      onTap: () {
                        print("The tapped Item is ${studio.name}");
                        Get.to(StudioView());
                      },
                      child: StudioCard(
                        netImg: true,
                        src: AppConstants.base_URL + studio.image,
                        text: studio.name,
                      ),
                    );
                  },
                );
              } else {
                return Text("Loading");
              }
            }),
          ),
        ),
      ],
    );
  }
}
