


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/ShimmerController.dart';
import 'package:um_media/Controller/StudioController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/InputField.dart';
import 'package:um_media/Models/Client.dart';
import 'package:um_media/Views/Homes/ClientHome/Home.dart';
import 'package:um_media/Controller/EnquireListController.dart';


class StudioForm extends StatelessWidget {
  StudioForm({super.key});

   final StudioController _studioController = Get.find();
   final EnquireListController _enquireListController = Get.find();
   final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _messageController = TextEditingController();




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Inquire Now",
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                "Fill the form, we will contact you soon",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            InputField(
              placeholderText: "Full Name",
              fieldController: _nameController,
              keyboardType: TextInputType.name,
              fieldPaddingleft: 20,
              fieldPaddingright: 20,
              expands: false,
            ),
            InputField(
              placeholderText: "Email",
              fieldController: _emailController,
              keyboardType: TextInputType.emailAddress,
              fieldPaddingleft: 20,
              fieldPaddingright: 20,
              expands: false,
            ),
            InputField(
              placeholderText: "Phone Number",
              fieldController: _phoneController,
              keyboardType: TextInputType.phone,
              fieldPaddingleft: 20,
              fieldPaddingright: 20,
              expands: false,
            ),
            SizedBox(
              height: 100,
              child: InputField(
                placeholderText: "Message",
                fieldController: _messageController,
                keyboardType: TextInputType.multiline,
                fieldPaddingleft: 20,
                fieldPaddingright: 20,
                maxlines: 2,
              ),
            ),
            ButtonCustom(
              buttonText: "Inquire Now",
              onPress: () async {
                if (_emailController.value.text.isEmpty ||
                    _phoneController.value.text.isEmpty ||
                    _messageController.value.text.isEmpty ||
                    _nameController.value.text.isEmpty) {
                  Get.defaultDialog(
                      title: "Error", middleText: "Please fill all the fields");
                }
                else if (_emailController.value.text == false) {
                  Get.defaultDialog(
                      title: "Error", middleText: "Please enter a Valid Email");
                } else {
                  var client = ClientEnquiry(
                    name: _nameController.text,
                    email: _emailController.text,
                    phone: _phoneController.text,
                    message: _messageController.text,
                  );
                
                  await _enquireListController.enquireStudios(client)
                      .then((value) {
                    if (value == true) {
                      Get.defaultDialog(
                        title: "Success",
                        middleText: "Inquiry Submitted Successfully \nWe will contact you soon",
                        onWillPop: () {
                          _enquireListController.studioList.clear();

                          Get.offAll(HomeScreen());
                          return Future.value(true);
                        },
                      );
                    } else {
                      Get.defaultDialog(
                          title: "Error",
                          middleText:
                          "Inquiry Submission Failed\n Returning to Home Screen",
                          onWillPop: () {
                            Get.offAll(HomeScreen());
                            return Future.value(true);
                          });
                    }
                  });
                }
              },
              foregroundColor: AppConstants.siteSubColor,
              backgroundColor: AppConstants.subTextGrey,
            ),
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: _enquireListController.studioList.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = _enquireListController.studioList[index];
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: CachedNetworkImage(
                          imageUrl:
                          AppConstants.base_URL + item.studio.image,
                          width: 25,
                          placeholder: (context, url) => ShimmerController.shimmerList(),
                        ),
                      ),
                      title: Text(
                          "${item.studio.name}"),
                      subtitle: Text("Studio for Inquire"),

                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
