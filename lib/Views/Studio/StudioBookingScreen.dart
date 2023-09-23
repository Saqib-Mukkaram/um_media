import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/InputField.dart';
import 'package:um_media/CustomWidgets/LabelText.dart';

class StudioBookingScreen extends StatefulWidget {
  const StudioBookingScreen({super.key});

  @override
  State<StudioBookingScreen> createState() => _StudioBookingScreenState();
}

class _StudioBookingScreenState extends State<StudioBookingScreen> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  var time = TimeOfDay.now().obs;
  var date = DateTime.now().obs;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      // Do something with the selected date
      print('Selected date: ${picked.toString()}');

      var year = picked.year;
      var month = picked.month;
      var day = picked.day;
      setState(() {
        // date.value = year.toString() + '-' + month.toString() + '-' + day.toString();
      });
    } else {
      setState(() {
        // date = DateTime.now();
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      // Do something with the selected time
      print('Selected time: ${picked.format(context)}');
    }
    var hour;
    var minute;
    hour = picked!.hour - 12;
    minute = picked.minute;
    setState(() {
      // time = hour.toString() + ":" + minute.toString();
    });
  }

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
          Text("Music Studio", style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 5,
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Image.asset(
              AppConstants.img_studio[0],
              width: 300,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelText(labelText: "Date"),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _selectDate(context);
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
                                return date.value == null
                                    ? Text("Select Date For Booking")
                                    : Text(
                                        "${date.value.year}/${date.value.month}/${date.value.day}");
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
                      onTap: () {
                        setState(() {
                          _selectTime(context);
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
                              label: date == null
                                  ? Text("Select Time For Booking")
                                  : Text(
                                      "${time.value.hour}:${time.value.minute}"),
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
            ],
          ),
          ButtonCustom(
            buttonText: "Book Now",
            onPress: () {},
            backgroundColor: AppConstants.subTextGrey,
            foregroundColor: AppConstants.siteSubColor,
          )
        ],
      ),
    );
  }
}
