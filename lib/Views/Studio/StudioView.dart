import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/ShimmerController.dart';
import 'package:um_media/Controller/StudioController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/Views/Studio/StudioBookingScreen.dart';

class StudioView extends StatefulWidget {
  const StudioView({super.key});

  @override
  State<StudioView> createState() => _StudioViewState();
}

class _StudioViewState extends State<StudioView> {
  StudioController _controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _refresh() async {
    // _controller.dispose();

    await _controller.fetchAll();
    print("studio Controller fetch ${_controller.studios.length}");
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
            future: _controller.getStudios(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                          color: AppConstants
                              .siteSubColor), // Show a loading indicator
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Error: Cannot Fetch Data."), // Show an error message
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                var studioList;
                return ListView.builder(
                    itemCount: _controller.studios.length,
                    itemBuilder: (BuildContext context, int index) {
                      studioList = _controller.studios.elementAt(index);
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
                                   
                                    child: CachedNetworkImage(
                                      imageUrl: AppConstants.base_URL +
                                          studioList.image,
                                      fit: BoxFit.fill,
                                     placeholder: (context, url) => ShimmerController.shimmerList(),
                                    )),
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
                                            itemCount: _controller.studios
                                                .elementAt(index)
                                                .gallery
                                                .length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              var Gallerylist = studioList
                                                  .gallery
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
                                                    child: CachedNetworkImage(
                                                      imageUrl: AppConstants
                                                              .base_URL +
                                                          Gallerylist.image,
                                                      width: 125,
                                                      height: 65,
                                                      fit: BoxFit.fill,
                                                    placeholder: (context, url) => ShimmerController.shimmerList(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
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
                                    Get.to(StudioBookingScreen(
                                      id: studioList.id,
                                    ));
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
