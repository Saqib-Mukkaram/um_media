import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/CheckBox.dart';
import 'package:um_media/CustomWidgets/CustomDropDown.dart';
import 'package:um_media/CustomWidgets/InputField.dart';
import 'package:um_media/CustomWidgets/LabelText.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  final TextEditingController _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      _nameController.dispose();
      _ageController.dispose();
      _addressController.dispose();
      super.dispose();
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.grey.shade300,
                          child: IconButton(
                            icon: Icon(
                              Icons.add_a_photo_outlined,
                              size: 36,
                            ),
                            onPressed: () {
                              Get.defaultDialog(title: "To be Implemented");
                            },
                          ),
                        )
                        // Image.asset(
                        //   "assets/imgs/People/Sana-4.png",
                        //   width: 100,
                        //   height: 100,
                        //   fit: BoxFit.fill,
                        // ),
                        ),
                    //     Positioned(
                    //   bottom: 0,
                    //   left: 65,
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(20),
                    //     child: Container(
                    //       width: 25,
                    //       height: 25,
                    //       color: Colors.black,
                    //       child: PopupMenuButton<String>(
                    //         color: Colors.white,
                    //         elevation: 5,
                    //         padding: EdgeInsets.all(0),
                    //         itemBuilder: (BuildContext context) {
                    //           return <PopupMenuEntry<String>>[
                    //             PopupMenuItem<String>(
                    //               value: "change_picture",
                    //               child: Text(
                    //                 "Change Picture",
                    //                 style: TextStyle(
                    //                   color: Colors.black, // Text color
                    //                   fontSize: 16, // Text size
                    //                 ),
                    //               ),
                    //             ),
                    //           ];
                    //         },
                    //         onSelected: (String choice) {
                    //           if (choice == "change_picture") {
                    //             //TODO: CHange the Picture Functionality
                    //             // Add your logic to change the picture here
                    //             print("Changing the picture");
                    //           }
                    //         },
                    //         child: Center(
                    //           child: Icon(
                    //             Icons.add_outlined,
                    //             color: Colors.white,
                    //             size: 14,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ]),
                ],
              ),
              LabelText(labelText: "Name", paddingbottom: 0),
              InputField(
                fieldController: _nameController,
                placeholderText: "Full Name",
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
                child: Container(width: size.width, child: CustomDropDown()),
              ),
              LabelText(labelText: "Age", paddingbottom: 0),
              InputField(
                fieldController: _ageController,
                placeholderText: "",
                height: 35,
                keyboardType: TextInputType.number,
              ),
              LabelText(labelText: "Address", paddingbottom: 0),
              InputField(
                fieldController: _addressController,
                placeholderText: "",
                height: 35,
              ),
              Divider(
                height: 30,
                endIndent: 16,
                indent: 16,
                color: AppConstants.siteSubColor,
              ),
              LabelText(labelText: "Weight (kg)", paddingbottom: 0),
              InputField(
                fieldController: _weightController,
                placeholderText: "",
                height: 35,
                keyboardType: TextInputType.number,
              ),
              LabelText(labelText: "Height (ft)", paddingbottom: 0),
              InputField(
                fieldController: _heightController,
                placeholderText: "",
                height: 35,
                keyboardType: TextInputType.number,
              ),
              ButtonCustom(
                buttonText: "Save Changes",
                onPress: () {
                  if (_addressController.value.text.isEmpty ||
                      _ageController.value.text.isEmpty ||
                      _heightController.value.text.isEmpty ||
                      _weightController.value.text.isEmpty ||
                      _nameController.value.text.isEmpty) {
                    Get.defaultDialog(
                        title: "Empty Fields",
                        middleText: "All fields are requried.");
                  } else if (_nameController.value.text.isEmpty) {
                    Get.defaultDialog(
                        title: "Full Name",
                        middleText: "Name Field is Requried.");
                  } else if (_ageController.value.text.length > 2 ||
                      _ageController.value.text.length < 2) {
                    Get.defaultDialog(
                        title: "Invalid Age",
                        middleText: "Please enter the correct age.");
                  } else if (_addressController.value.text.isEmpty) {
                    Get.defaultDialog(
                        title: "Address Field",
                        middleText: "Address Field is Empty.");
                  } else if (_weightController.value.text.isEmpty) {
                    Get.defaultDialog(
                        title: "Weight Field",
                        middleText: "Weight Field is Required.");
                  } else if (_heightController.value.text.isEmpty) {
                    Get.defaultDialog(
                        title: "Height is Empty",
                        middleText: " Please enter the height.");
                  }
                  Get.defaultDialog(title: "To be Implemented");
                },
                backgroundColor: Colors.black,
                foregroundColor: AppConstants.siteSubColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
