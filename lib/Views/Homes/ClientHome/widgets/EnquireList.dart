// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/EnquireListController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';

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
    setState(() {
      _enquireListController.fetchAll();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isAvailble =
        _enquireListController.enquireList.isEmpty ? false.obs : true.obs;
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Stack(
        children: [
          Obx(
            () => isAvailble.value
                ? ListView.builder(
                    itemCount: _enquireListController.enquireList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = _enquireListController.enquireList[index];
                      var tagsText = item.rooster.interests
                          .map((tag) => tag.name)
                          .join(', ');
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Image.network(AppConstants.base_URL +
                                item.rooster.profileImage),
                          ),
                          title: Text(
                              "${item.rooster.firstName + " " + item.rooster.lastName}"),
                          subtitle: Text(tagsText),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                _enquireListController.enquireList
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
                        _enquireListController.enquireList.isEmpty
                            ? Get.defaultDialog(
                                title: "Enquire list empty",
                                middleText: "Add some roosters!")
                            : {
                                Get.defaultDialog(
                                    title: "Rooster Enquired",
                                    middleText: "We will Contact you soon!"),
                                setState(() {
                                  _enquireListController.enquireList.clear();
                                })
                              };
                      },
                      foregroundColor: AppConstants.siteSubColor,
                      backgroundColor: AppConstants.subTextGrey,
                    ),
                  
                ],
              ))
        ],
      ),
    );
  }
}
