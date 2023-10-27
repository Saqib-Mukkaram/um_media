import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/EnquireListController.dart';
import 'package:um_media/Controller/StudioController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/InputField.dart';
import 'package:um_media/CustomWidgets/LabelText.dart';
import 'package:um_media/Views/Studio/StudioForm.dart';

class StudioBookingScreen extends StatefulWidget {
  final int id;

  StudioBookingScreen({required this.id, super.key});

  @override
  State<StudioBookingScreen> createState() => _StudioBookingScreenState();
}

class _StudioBookingScreenState extends State<StudioBookingScreen> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final StudioController _controller = Get.find();
  final EnquireListController _enquireListController = Get.find();

  var time = TimeOfDay.now().obs;
  var date = DateTime.now().obs;
  var date_after = ''.obs; // Assuming it's a String
  var time_after = ''.obs; // Assuming it's a String
  var date_check = false;
  var time_check = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    //wrap with if
    if (picked != null) {
      date.value = picked!;
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      time.value = picked!;
    }
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
    var studiolist =
        _controller.studios.where((element) => element.id == widget.id).first;
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
          "Booking",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
              "${_controller.studios.where((element) => element.id == widget.id).first.name}",
              style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: CachedNetworkImage(
                  imageUrl: AppConstants.base_URL + studiolist.image,
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Padding(
                    padding: EdgeInsets.fromLTRB(32, 64, 32, 64),
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                      color: AppConstants.siteSubColor,
                    ),
                  ),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelText(labelText: "Date"),
                  InkWell(
                      onTap: () async {
                        await _selectDate(context);
                        setState(() {
                          date_check = true;
                          date_after.value =
                              "${date.value.year}/${date.value.month}/${date.value.day}";
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: 175,
                          child: TextFormField(
                            enabled: false,
                            controller: _dateController,
                            decoration: InputDecoration(
                              label: Obx(() {
                                return date_after.value == ''
                                    ? Text("Select Date For Booking")
                                    : Text(date_after.value);
                              }),
                              // border: const OutlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.grey),
                              //   borderRadius: BorderRadius.all(
                              //     Radius.circular(8),
                              //   ),
                              // ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              // errorText: "This is a requirement",
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              fillColor: Colors.white,

                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelText(labelText: "Time"),
                  InkWell(
                      onTap: () async {
                        await _selectTime(context);
                        setState(() {
                          time_check = true;
                          time_after.value =
                              "${time.value.hour > 12 ? time.value.hour - 12 : time.value.hour}:${time.value.minute}";
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: 175,
                          child: TextFormField(
                            enabled: false,
                            controller: _timeController,
                            decoration: InputDecoration(
                              label: Obx(() => time_after.value == ''
                                  ? Text("Select Time For Booking")
                                  : Text(time_after.value)),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              // errorText: "This is a requirement",
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              fillColor: Colors.white,

                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ],
          ),
          ButtonCustom(
            buttonText: "Book Now",
            onPress: () {
              if (date_check == false) {
                Get.defaultDialog(
                    title: "Missing Fields",
                    middleText: "Please Enter the Date.");
              } else if (time_check == false) {
                Get.defaultDialog(
                    title: "Missing Fields",
                    middleText: "Please Enter the Time.");
              } else {
                _enquireListController.studioList.add(EnquireStudio(
                  studio: _controller.studios
                      .where((element) => element.id == widget.id)
                      .first,
                ));
                Get.to(StudioForm());
              }
            },
            backgroundColor: AppConstants.subTextGrey,
            foregroundColor: AppConstants.siteSubColor,
          )
        ],
      ),
    );
  }
}
