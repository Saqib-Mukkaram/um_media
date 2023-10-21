import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/GalleryController.dart';
import 'package:um_media/Controller/RegisterController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/CheckBox.dart';
import 'package:um_media/CustomWidgets/CustomDropDown.dart';
import 'package:um_media/CustomWidgets/InputField.dart';
import 'package:um_media/CustomWidgets/LabelText.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:um_media/Models/Register.dart';
import 'package:um_media/Views/Homes/HomeArtisan/Home_artisan.dart';
import 'package:um_media/Views/Registeration/RoosterRegistering.dart';
// import 'package:um_media/lib/Controller/GalleryController.dart';

class RegisterProfilePage extends StatefulWidget {
  final Register register;

  const RegisterProfilePage({required this.register, super.key});

  @override
  State<RegisterProfilePage> createState() => _RegisterProfilePageState();
}

class _RegisterProfilePageState extends State<RegisterProfilePage> {
  // final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final RegisterController _registerController = RegisterController();
  final List<String> items = AppConstants.talentlist;
  List<String> selectedItems = [];
  List<String> selectedItemsIndex = [];
  Map<String, int>? interests;
  final picker = ImagePicker();
  var image;
  var date = DateTime.now().obs;
  var picked;

  Future<void> _selectDate(BuildContext context) async {
    picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      date.value = picked;
      setState(() {});
    } else {
      date.value = DateTime.now();
      setState(() {});
    }
  }

  Future<void> _getImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      // Handle the picked image
      // ...
      setState(() {
        image = pickedFile!.path;
      });
    } catch (e) {
      print('Error: $e');
    }
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // _nameController.dispose();
    _ageController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        borderRadius: BorderRadius.circular(75),
                        child: Container(
                            height: 150,
                            width: 150,
                            color: Colors.grey.shade300,
                            child: image == null
                                ? IconButton(
                                    icon: Icon(
                                      Icons.add_a_photo_outlined,
                                      size: 36,
                                    ),
                                    onPressed: () async {
                                      _getImage();
                                    },
                                  )
                                : Image.file(
                                    File(image),
                                    fit: BoxFit.cover,
                                  ))),
                    image != null
                        ? Positioned(
                            bottom: 0,
                            left: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                width: 35,
                                height: 35,
                                color: Colors.grey.shade900,
                                child: PopupMenuButton<String>(
                                  color: Colors.white,
                                  elevation: 5,
                                  padding: EdgeInsets.all(0),
                                  itemBuilder: (BuildContext context) {
                                    return <PopupMenuEntry<String>>[
                                      PopupMenuItem<String>(
                                        value: "change_picture",
                                        child: Text(
                                          "Change Picture",
                                          style: TextStyle(
                                            color: Colors.black, // Text color
                                            fontSize: 16, // Text size
                                          ),
                                        ),
                                      ),
                                    ];
                                  },
                                  onSelected: (String choice) {
                                    if (choice == "change_picture") {
                                      //TODO: CHange the Picture Functionality
                                      _getImage();
                                      setState(() {});
                                    }
                                  },
                                  child: Center(
                                    child: Icon(
                                      Icons.add_outlined,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox()
                  ]),
                ],
              ),
              LabelText(labelText: "Interests", paddingbottom: 0),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Container(
                  width: size.width,
                  child: DropdownButton2<String>(
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    isExpanded: true,
                    hint: Text(
                      'Select Interests',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        //disable default onTap to avoid closing menu when selecting an item
                        enabled: false,
                        child: StatefulBuilder(
                          builder: (context, menuSetState) {
                            final isSelected = selectedItems.contains(item);
                            return InkWell(
                              onTap: () {
                                isSelected
                                    ? selectedItems.remove(item)
                                    : {
                                        selectedItems.add(item),
                                        selectedItemsIndex
                                            .add(items.indexOf(item).toString())
                                      };

                                //This rebuilds the StatefulWidget to update the button's text
                                setState(() {});
                                //This rebuilds the dropdownMenu Widget to update the check mark
                                menuSetState(() {});
                              },
                              child: Container(
                                height: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  children: [
                                    if (isSelected)
                                      const Icon(Icons.check_box_outlined)
                                    else
                                      const Icon(Icons.check_box_outline_blank),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                    value: selectedItems.isEmpty ? null : selectedItems.last,
                    onChanged: (value) {},
                    selectedItemBuilder: (context) {
                      return items.map(
                        (item) {
                          return Container(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              selectedItems.join(', '),
                              style: const TextStyle(
                                fontSize: 14,
                                // overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 1,
                            ),
                          );
                        },
                      ).toList();
                    },

                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
              LabelText(labelText: "Date of Birth", paddingbottom: 0),
              InkWell(
                onTap: () {
                  setState(() {
                    _selectDate(context);
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: size.width,
                    child: TextFormField(
                      enabled: false,
                      controller: _dateController,
                      decoration: InputDecoration(
                        label: Obx(() {
                          return date.value == DateTime.now()
                              ? Text("Date Of Birth")
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
                          color: date.value == DateTime.now()
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              LabelText(labelText: "Country", paddingbottom: 0),
              InputField(
                fieldController: _countryController,
                placeholderText: "",
                height: 35,
              ),
              LabelText(labelText: "State", paddingbottom: 0),
              InputField(
                fieldController: _stateController,
                placeholderText: "",
                height: 35,
              ),
              LabelText(labelText: "City", paddingbottom: 0),
              InputField(
                fieldController: _cityController,
                placeholderText: "",
                height: 35,
              ),
              // Divider(
              //   height: 50,
              //   endIndent: 16,
              //   indent: 16,
              //   color: AppConstants.subTextGrey,
              // ),
              LabelText(
                labelText: "Weight (kg)",
                paddingbottom: 0,
              ),
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
                buttonText: "Register",
                onPress: () async {
                  var flag = false;
                  if (selectedItems.isEmpty) {
                    Get.defaultDialog(
                        title: "Interests are Empty",
                        middleText: " Please select the interests.");
                  } else if (_countryController.value.text.isEmpty) {
                    Get.defaultDialog(
                        title: "State Field",
                        middleText: "State Field is Empty.");
                  } else if (_stateController.value.text.isEmpty) {
                    Get.defaultDialog(
                        title: "State Field",
                        middleText: "State Field is Empty.");
                  } else if (_cityController.value.text.isEmpty) {
                    Get.defaultDialog(
                        title: "City Field",
                        middleText: "City Field is Empty.");
                  } else if (_weightController.value.text.isEmpty) {
                    Get.defaultDialog(
                        title: "Weight Field",
                        middleText: "Weight Field is Required.");
                  } else if (_heightController.value.text.isEmpty) {
                    Get.defaultDialog(
                        title: "Height is Empty",
                        middleText: " Please enter the height.");
                  } else if (image == null) {
                    Get.defaultDialog(
                        title: "Profile Picture",
                        middleText: "Profile Picture is Required.");
                  } else {
                    // createMap();
                    widget.register.city = _cityController.value.text;
                    widget.register.state = _stateController.value.text;
                    widget.register.country = _countryController.value.text;
                    widget.register.dob =
                        "${date.value.year}-${date.value.month}-${date.value.day}";
                    widget.register.interests = selectedItemsIndex;
                    widget.register.profileImage = File(image);
                    widget.register.height = _heightController.value.text;
                    widget.register.weight = _weightController.value.text;
                    flag = true;
                  }
                  if (flag == true) {
                    Get.to(() => RoosterRegistering(
                          rooster: widget.register,
                        ));
                  }
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
