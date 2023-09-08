import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/CheckBox.dart';
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
  final TextEditingController _waistController = TextEditingController();
  final TextEditingController _hipsController = TextEditingController();
  final TextEditingController _bustController = TextEditingController();

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
          "Edit Profile",
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
                      child: Image.asset(
                        "assets/imgs/People/Sana-4.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
  bottom: 0,
  left: 65,
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      width: 25,
      height: 25,
      color: Colors.black,
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
                  fontSize: 12, // Text size
                ),
              ),
            ),
          ];
        },
        onSelected: (String choice) {
          if (choice == "change_picture") {
            //TODO: CHange the Picture Functionality
            // Add your logic to change the picture here
            print("Changing the picture");
          }
        },
        child: Center(
          child: Icon(
            Icons.add_outlined,
            color: Colors.white,
            size: 10,
          ),
        ),
      ),
    ),
  ),
)

                  ]),
                ],
              ),
              LabelText(labelText: "Name", paddingbottom: 0),
              InputField(
                fieldController: _nameController,
                placeholderText: "Sana Mirza",
                height: 35,
              ),
              Row(
                children: [
                  CheckBoxCustom(),
                  LabelText(
                    labelText: "Actor",
                    paddingleft: 0,
                    paddingtop: 0,
                    paddingbottom: 0,
                  ),
                  CheckBoxCustom(),
                  LabelText(
                    labelText: "Singer",
                    paddingleft: 0,
                    paddingtop: 0,
                    paddingbottom: 0,
                  ),
                  CheckBoxCustom(),
                  LabelText(
                    labelText: "DJ",
                    paddingleft: 0,
                    paddingtop: 0,
                    paddingbottom: 0,
                  ),
                  CheckBoxCustom(),
                  LabelText(
                    labelText: "Photographer",
                    paddingleft: 0,
                    paddingtop: 0,
                    paddingbottom: 0,
                  ),
                ],
              ),
              Row(
                children: [
                  CheckBoxCustom(),
                  LabelText(
                    labelText: "Youtuber",
                    paddingleft: 0,
                    paddingtop: 0,
                    paddingbottom: 0,
                  ),
                  CheckBoxCustom(),
                  LabelText(
                    labelText: "Voice Over",
                    paddingleft: 0,
                    paddingtop: 0,
                    paddingbottom: 0,
                  ),
                  CheckBoxCustom(),
                  LabelText(
                    labelText: "Dancer",
                    paddingleft: 0,
                    paddingtop: 0,
                    paddingbottom: 0,
                  ),
                ],
              ),
              LabelText(labelText: "Age", paddingbottom: 0),
              InputField(
                fieldController: _ageController,
                placeholderText: "Sana Mirza",
                height: 35,
                keyboardType: TextInputType.number,
              ),
              LabelText(labelText: "Address", paddingbottom: 0),
              InputField(
                fieldController: _addressController,
                placeholderText: "Street no ....",
                height: 35,
              ),
              Divider(
                height: 30,
                endIndent: 16,
                indent: 16,
                color: AppConstants.siteSubColor,
              ),
              LabelText(labelText: "Waist", paddingbottom: 0),
              InputField(
                fieldController: _waistController,
                placeholderText: "",
                height: 35,
                keyboardType: TextInputType.number,
              ),
              LabelText(labelText: "Bust", paddingbottom: 0),
              InputField(
                fieldController: _bustController,
                placeholderText: "",
                height: 35,
                keyboardType: TextInputType.number,
              ),
              LabelText(labelText: "Hips", paddingbottom: 0),
              InputField(
                fieldController: _hipsController,
                placeholderText: "",
                height: 35,
                keyboardType: TextInputType.number,
              ),
              ButtonCustom(
                buttonText: "Save Changes",
                onPress: () {},
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
