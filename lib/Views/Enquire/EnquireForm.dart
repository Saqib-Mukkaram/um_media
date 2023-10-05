import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/EnquireListController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/CustomAppBar.dart';
import 'package:um_media/CustomWidgets/InputField.dart';
import 'package:um_media/Views/Homes/ClientHome/Home.dart';

class EnquireForm extends StatelessWidget {
  EnquireForm({super.key});

  final scaffoldkey = GlobalKey<ScaffoldState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final EnquireListController _enquireListController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enquire Form", style: TextStyle(color: Colors.white)),
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
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Enquire Now",
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
              buttonText: "Enquire Now",
              onPress: () {
                if (_emailController.value.text.isEmpty ||
                    _phoneController.value.text.isEmpty ||
                    _messageController.value.text.isEmpty ||
                    _nameController.value.text.isEmpty) {
                  Get.defaultDialog(
                      title: "Error", middleText: "Please fill all the fields");
                } else {
                  Get.defaultDialog(
                    backgroundColor: Colors.white,
                      title: "Rooster Enquired",
                      middleText: "We will Contact you soon!",
                      confirm: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstants.subTextGrey,
                          foregroundColor: AppConstants.siteSubColor,

                        ),
                        onPressed: () {
                          Get.offAll(HomeScreen());
                        },
                        child: Text("Okay"),
                      ));

                  _enquireListController.roosterEnquireList.clear();
                  
                  
                }
              },
              foregroundColor: AppConstants.siteSubColor,
              backgroundColor: AppConstants.subTextGrey,
            ),
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: _enquireListController.roosterEnquireList.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = _enquireListController.roosterEnquireList[index];
                  var tagsText =
                      item.rooster.interests.map((tag) => tag.name).join(', ');
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: CachedNetworkImage(
                          imageUrl:
                              AppConstants.base_URL + item.rooster.profileImage,
                          width: 25,
                        ),
                      ),
                      title: Text(
                          "${item.rooster.firstName + " " + item.rooster.lastName}"),
                      subtitle: Text(tagsText),
                      // trailing: IconButton(
                      //   onPressed: () {
                      //     _enquireListController.enquireList.removeAt(index);
                      //   },
                      //   icon: Icon(
                      //     Icons.delete_outlined,
                      //     color: Colors.red.shade500,
                      //   ),
                      // ),
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

Future<dynamic> EnquireBottomSheet(BuildContext context, Size size) {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext context) {
      TextEditingController _nameController = TextEditingController();
      TextEditingController _emailController = TextEditingController();
      TextEditingController _phoneController = TextEditingController();
      TextEditingController _messageController = TextEditingController();

      return Container(
        height: size.height,
        width: size.width,
        // color: Colors.white,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Enquire Now",
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
                ),
                InputField(
                  placeholderText: "Email",
                  fieldController: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  fieldPaddingleft: 20,
                  fieldPaddingright: 20,
                ),
                InputField(
                  placeholderText: "Phone Number",
                  fieldController: _phoneController,
                  keyboardType: TextInputType.phone,
                  fieldPaddingleft: 20,
                  fieldPaddingright: 20,
                ),
                InputField(
                  placeholderText: "Message",
                  fieldController: _messageController,
                  keyboardType: TextInputType.multiline,
                  fieldPaddingleft: 20,
                  fieldPaddingright: 20,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
