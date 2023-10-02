import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/IconInputField.dart';
import 'package:um_media/CustomWidgets/InputField.dart';
import 'package:um_media/CustomWidgets/LabelText.dart';
import 'package:um_media/CustomWidgets/TextWithDividers.dart';
import 'package:um_media/Views/Login/Login.dart';
import 'package:um_media/Views/Profile/ProfilePage.dart';
import 'package:um_media/Views/Splash/spalsh.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController _genderController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool agreedToTerms = false;
  bool IsModel = false;
  var gender;
  @override
  void initState() {
    _tabController = TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 1,
      animationDuration: Duration(seconds: 1),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Image.asset(AppConstants.Logo, width: 100, height: 100),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                  child: Center(
                    child: Text(
                      "join_us".tr,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                Text(
                  "join_us_descp".tr,
                  style:
                      TextStyle(fontSize: 18, color: AppConstants.login_text),
                ),
                SizedBox(
                  height: 10,
                ),
                TabBar(
                  controller: _tabController,
                  // dividerColor: AppConstants.siteSubColor,
                  indicatorColor: AppConstants.siteSubColor,
                  tabs: [
                    // Tab(
                    //   iconMargin: EdgeInsets.all(0),
                    //   child: ElevatedButton.icon(
                    //       style: ElevatedButton.styleFrom(elevation: 0),
                    //       onPressed: () {
                    //         _tabController.animateTo(0);
                    //       },
                    //       icon: Icon(
                    //         Icons.perm_identity_outlined,
                    //         color: AppConstants.siteSubColor,
                    //       ),
                    //       label: Text(
                    //         "User",
                    //         style: TextStyle(color: AppConstants.siteSubColor),
                    //       )),
                    // ),
                    Tab(
                      iconMargin: EdgeInsets.all(0),
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(elevation: 0),
                          onPressed: () {
                            _tabController.animateTo(0);
                          },
                          icon: Icon(
                            Icons.star_outlined,
                            color: AppConstants.siteSubColor,
                          ),
                          label: Text(
                            "Model",
                            style: TextStyle(color: AppConstants.siteSubColor),
                          )),
                    ),
                  ],
                ),
                Container(
                  height: 700,
                  child: TabBarView(controller: _tabController, children: [
                    // SingleChildScrollView(
                    //   child: Column(
                    //     children: [
                    //       SizedBox(
                    //         height: 10,
                    //       ),
                    //       //globalization TODO: Globalization
                    //       IconInputField(
                    //         placeholderText: "First Name",
                    //         fieldController: _firstnameController,
                    //         fieldPaddingleft: 20,
                    //         fieldPaddingright: 20,
                    //         prefixIcon: Icon(
                    //           Icons.perm_identity_outlined,
                    //         ),
                    //       ),
                    //       IconInputField(
                    //         placeholderText: "Last Name",
                    //         fieldController: _lastnameController,
                    //         fieldPaddingleft: 20,
                    //         fieldPaddingright: 20,
                    //         prefixIcon: Icon(
                    //           Icons.perm_identity_outlined,
                    //         ),
                    //       ),
                    //       //TODO:ADD to the Languages

                    //       IconInputField(
                    //         placeholderText: "email".tr,
                    //         fieldController: _emailController,
                    //         fieldPaddingleft: 20,
                    //         fieldPaddingright: 20,
                    //         prefixIcon: Icon(
                    //           Icons.alternate_email_outlined,
                    //         ),
                    //       ),
                    //       //TODO:ADD to the Languages

                    //       IconInputField(
                    //         placeholderText: "password".tr,
                    //         fieldController: _passwordController,
                    //         obscureText: true,
                    //         fieldPaddingleft: 20,
                    //         fieldPaddingright: 20,
                    //         keyboardType: TextInputType.visiblePassword,
                    //         prefixIcon: Icon(
                    //           Icons.lock_outlined,
                    //         ),
                    //       ),
                    //       IconInputField(
                    //         placeholderText: "confirm_password".tr,
                    //         fieldController: _confirmPasswordController,
                    //         fieldPaddingleft: 20,
                    //         fieldPaddingright: 20,
                    //         obscureText: true,
                    //         keyboardType: TextInputType.visiblePassword,
                    //         prefixIcon: Icon(
                    //           Icons.lock_outlined,
                    //         ),
                    //       ),
                    //       Row(
                    //         children: [
                    //           Checkbox(
                    //               fillColor: MaterialStateProperty.resolveWith(
                    //                   (states) {
                    //                 if (!states
                    //                     .contains(MaterialState.selected)) {
                    //                   return null;
                    //                 }
                    //                 return AppConstants.subTextGrey;
                    //               }),
                    //               shape: RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.all(
                    //                   Radius.circular(5),
                    //                 ),
                    //               ),
                    //               value: agreedToTerms,
                    //               onChanged: (bool? value) {
                    //                 setState(() {
                    //                   agreedToTerms = value!;
                    //                 });
                    //               }),
                    //           LabelText(
                    //               labelText: "agree_to_terms".tr,
                    //               paddingleft: 0,
                    //               paddingbottom: 0,
                    //               paddingright: 0,
                    //               paddingtop: 0),
                    //         ],
                    //       ),
                    //       ButtonCustom(
                    //         buttonText: "register_button".tr,
                    //         onPress: () {

                    //           var response;
                    //         },
                    //         backgroundColor: AppConstants.subTextGrey,
                    //         foregroundColor: AppConstants.siteSubColor,
                    //         elevation: 2,
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    //Second Tab here
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          //TODO:ADD to the Languages
                          IconInputField(
                            fieldPaddingleft: 20,
                            fieldPaddingright: 20,
                            placeholderText: "First Name".tr,
                            fieldController: _firstnameController,
                            prefixIcon: Icon(
                              Icons.badge_outlined,
                            ),
                          ),
                          //TODO:ADD to the Languages
                          IconInputField(
                            placeholderText: "Last Name".tr,
                            fieldController: _lastnameController,
                            fieldPaddingleft: 20,
                            fieldPaddingright: 20,
                            prefixIcon: Icon(
                              Icons.badge_outlined,
                            ),
                          ),
                          IconInputField(
                            placeholderText: "email".tr,
                            fieldController: _emailController,
                            fieldPaddingleft: 20,
                            fieldPaddingright: 20,
                            prefixIcon: Icon(
                              Icons.alternate_email_outlined,
                            ),
                          ),
                          //TODO:ADD to the Languages
                          IconInputField(
                            placeholderText:
                                "Phone Number With Country Code: ".tr,
                            fieldController: _phoneNumberController,
                            keyboardType: TextInputType.phone,
                            fieldPaddingleft: 20,
                            fieldPaddingright: 20,
                            prefixIcon: Icon(
                              Icons.phone_outlined,
                            ),
                          ),

                          //TODO: TAKE a Look

                          IconInputField(
                            placeholderText: "password".tr,
                            fieldController: _passwordController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            fieldPaddingleft: 20,
                            fieldPaddingright: 20,
                            prefixIcon: Icon(
                              Icons.lock_outlined,
                            ),
                          ),
                          IconInputField(
                            placeholderText: "confirm_password".tr,
                            fieldController: _confirmPasswordController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            fieldPaddingleft: 20,
                            fieldPaddingright: 20,
                            prefixIcon: Icon(
                              Icons.lock_outlined,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: DropDownTextField(
                              textFieldDecoration: InputDecoration(
                                label: Text("Gender"),
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
                              clearOption: false,
                              dropdownColor: Colors.white,
                              // searchAutofocus: true,
                              dropDownItemCount: 2,
                              searchShowCursor: false,

                              dropDownList: [
                                DropDownValueModel(name: 'Male', value: 0),
                                DropDownValueModel(
                                  name: 'Female',
                                  value: 1,
                                ),
                              ],
                              onChanged: (val) {
                                gender = val.name;
                                _genderController.text = val.name;
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  fillColor: MaterialStateProperty.resolveWith(
                                      (states) {
                                    if (!states
                                        .contains(MaterialState.selected)) {
                                      return null;
                                    }
                                    return AppConstants.subTextGrey;
                                  }),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  value: agreedToTerms,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      agreedToTerms = value!;
                                    });
                                  }),
                              LabelText(
                                  labelText: "agree_to_terms".tr,
                                  paddingleft: 0,
                                  paddingbottom: 0,
                                  paddingright: 0,
                                  paddingtop: 0),
                            ],
                          ),
                          ButtonCustom(
                            buttonText: "register_button".tr,
                            onPress: () {
                              if (_emailController.value.text.isEmpty ||
                                  _firstnameController.value.text.isEmpty ||
                                  _lastnameController.value.text.isEmpty ||
                                  _emailController.value.text.isEmpty ||
                                  _passwordController.value.text.isEmpty ||
                                  _confirmPasswordController
                                      .value.text.isEmpty) {
                                Get.defaultDialog(
                                    title: "Please Fill all the fields",
                                    middleText: "All the fields are required");
                              } else if (_emailController.value.text.isEmail ==
                                  false) {
                                Get.defaultDialog(
                                    title: "Invalid Email",
                                    middleText: "Please Enter a valid Email");
                              } else if (_passwordController.value.text.length <
                                  6) {
                                Get.defaultDialog(
                                    title: "Weak Password",
                                    middleText:
                                        "Please Enter a valid Password Greater than 6 Charcters");
                              } else if (_passwordController.value.text !=
                                  _confirmPasswordController.value.text) {
                                Get.defaultDialog(
                                    title: "Password Mismatch",
                                    middleText:
                                        "Please Enter the Same Password in Both Fields");
                              } else if (_genderController.value.text.isEmpty) {
                                Get.defaultDialog(
                                    title: "Select Gender",
                                    middleText: "Please select the Gender");
                              } else if (agreedToTerms == false) {
                                Get.defaultDialog(
                                    title: "Terms and Conditions",
                                    middleText:
                                        "Please Agree to the Terms and Conditions");
                              }

                              Get.to(ProfilePage());
                            },
                            backgroundColor: AppConstants.subTextGrey,
                            foregroundColor: AppConstants.siteSubColor,
                            elevation: 2,
                          ),
                          TextWithDividers(
                            text: "or".tr,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 0,
                              ),
                              onPressed: () {
                                Get.to(LoginScreen());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "no_account".tr,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  ),
                                  LabelText(
                                    labelText: "login_button".tr,
                                    paddingbottom: 0,
                                    paddingleft: 0,
                                    paddingright: 0,
                                    paddingtop: 0,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
