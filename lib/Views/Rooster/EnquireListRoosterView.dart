// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/EnquireListController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/Views/Enquire/EnquireForm.dart';

class EnquireListRoosterView extends StatefulWidget {
  EnquireListRoosterView({
    super.key,
  });

  @override
  State<EnquireListRoosterView> createState() => _EnqurieListRoosterViewState();
}

class _EnqurieListRoosterViewState extends State<EnquireListRoosterView> {
  EnquireListController _enquireListController = Get.find();

  Future<void> _refresh() async {

      _enquireListController.fetchAll();
  }

  @override
  void initState() {
   
    super.initState();
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isAvailble =
        _enquireListController.roosterEnquireList.isEmpty ? false.obs : true.obs;
    return Scaffold(
      appBar: AppBar(
        title: Text("Enquire List", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppConstants.subTextGrey,
        leading: Row(children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
          ),
        ]
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: Stack(
            children: [
              Obx(
                () => isAvailble.value
                    ? ListView.builder(
                        itemCount: _enquireListController.roosterEnquireList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = _enquireListController.roosterEnquireList[index];
                          var tagsText = item.rooster.interests
                              .map((tag) => tag.name)
                              .join(', ');
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                child: CachedNetworkImage(
                                    imageUrl: AppConstants.base_URL +
                                        item.rooster.profileImage),
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
          ),
        ),
      ),
    );
  }
}
