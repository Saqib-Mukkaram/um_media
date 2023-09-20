import 'package:flutter/material.dart';

// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/StudioController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/StudioBookingScreen.dart';

class StudioView extends StatefulWidget {
  const StudioView({super.key});

  @override
  State<StudioView> createState() => _StudioViewState();
}

class _StudioViewState extends State<StudioView> {
  final StudioController _controller = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _refresh() async {
    await _controller.getStudios();
    await _controller.getStudioList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Studios",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        color: AppConstants.siteSubColor,
        backgroundColor: AppConstants.subTextGrey,
        onRefresh: _refresh,
        child: FutureBuilder(
            future: _refresh(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: _controller.studiosList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var studioList = _controller.studiosList.elementAt(index);
                      return Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Card(
                          color: Colors.white,
                          elevation: 8,
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      studioList.name,
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                                  child:
                                      Image.asset(AppConstants.img_studio[0]),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Photos",
                                        style: TextStyle(fontSize: 18))
                                  ],
                                ),
                                Container(
                                    width: 500,
                                    height: 100,
                                    child: FutureBuilder(
                                      future: _refresh(),
                                      builder: (context, snapshot) {
                                        return ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                _controller.studios.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              var Gallerylist = _controller
                                                  .studios
                                                  .elementAt(index);
                                              return Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Material(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(12)),
                                                  elevation: 8,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12)),
                                                    child: Image.network(
                                                      AppConstants.base_URL +
                                                          Gallerylist.image,
                                                      width: 125,
                                                      height: 65,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                    )),
                                ButtonCustom(
                                  buttonText: "Book Studio",
                                  onPress: () {
                                    Get.to(StudioBookingScreen());
                                  },
                                  backgroundColor: AppConstants.subTextGrey,
                                  foregroundColor: AppConstants.siteSubColor,
                                  paddingTop: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return Center(child: Text("Loading"));
              }
            }),
      ),
    );
  }
}
