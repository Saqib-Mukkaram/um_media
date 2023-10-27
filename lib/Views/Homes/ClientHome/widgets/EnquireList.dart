// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/EnquireListController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/Views/Enquire/EnquireForm.dart';

class EnqurieList extends StatefulWidget {
  EnqurieList({
    super.key,
  });

  @override
  State<EnqurieList> createState() => _EnqurieListState();
}

class _EnqurieListState extends State<EnqurieList> {
  EnquireListController _enquireListController = Get.find();

  Future<void> _refresh() async {
    await _enquireListController.fetchAll();
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    var isAvailble =
        _enquireListController.roosterEnquireList.isEmpty ? false.obs : true.obs;
    return FutureBuilder(
        future: _refresh(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Obx(
                  () => isAvailble.value
                      ? ListView.builder(
                          itemCount: _enquireListController.roosterEnquireList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var item =
                                _enquireListController.roosterEnquireList[index];
                            var tagsText = item.rooster.interests
                                .map((tag) => tag.name)
                                .join(', ');
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ListTile(

                                leading: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  child: CachedNetworkImage(
                                      imageUrl: AppConstants.base_URL +
                                          item.rooster.profileImage, width: 25,),
                                ),
                                title: Text(
                                    "${item.rooster.firstName + " " + item.rooster.lastName}"),
                                subtitle: Text(tagsText),
                                trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _enquireListController.roosterEnquireList
                                        .removeAt(index);
                                    });
                                    
                                  },
                                  icon: Icon(
                                    Icons.delete_outlined,
                                    color: Colors.red.shade500,
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.warning_outlined,
                                size: 60,
                                color: AppConstants.siteSubColor,
                              ),
                              //TODO: Needed to add to the Languages File
                              Text(
                                "Enquire List Empty!",
                                style: TextStyle(fontSize: 32),
                              )
                            ],
                          ),
                        ),
                ),
                Positioned(
                    bottom: 0,
                    child: Column(
                      children: [
                        ButtonCustom(
                          buttonText: "Enquire",
                          onPress: () {
                            _enquireListController.roosterEnquireList.isEmpty
                                ? Get.defaultDialog(
                                    title: "Enquire list empty",
                                    middleText: "Add some roosters!")
                                : {
                                  Get.to(EnquireForm())
                                    
                                  };
                          },
                          foregroundColor: AppConstants.siteSubColor,
                          backgroundColor: AppConstants.subTextGrey,
                        ),
                      ],
                    ))
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
