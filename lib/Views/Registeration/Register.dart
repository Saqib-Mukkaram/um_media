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
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool agreedToTerms = false;
  bool IsModel = false;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
      length: 2,
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
                    Tab(
                      iconMargin: EdgeInsets.all(0),
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(elevation: 0),
                          onPressed: () {
                            _tabController.animateTo(0);
                          },
                          icon: Icon(
                            Icons.perm_identity_outlined,
                            color: AppConstants.siteSubColor,
                          ),
                          label: Text(
                            "User",
                            style: TextStyle(color: AppConstants.siteSubColor),
                          )),
                    ),
                    Tab(
                      iconMargin: EdgeInsets.all(0),
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(elevation: 0),
                          onPressed: () {
                            _tabController.animateTo(1);
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
                  height: 550,
                  child: TabBarView(
                    
                    controller: _tabController, children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          IconInputField(
                            placeholderText: "Full Name".tr,
                            fieldController: _fullnameController,
                            fieldPaddingleft: 20,
                            fieldPaddingright: 20,
                            prefixIcon: Icon(
                              Icons.perm_identity_outlined,
                            ),
                          ),
                          //TODO:ADD to the Languages

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
                            placeholderText: "password".tr,
                            fieldController: _passwordController,
                            obscureText: true,
                            fieldPaddingleft: 20,
                            fieldPaddingright: 20,
                            keyboardType: TextInputType.visiblePassword,
                            prefixIcon: Icon(
                              Icons.lock_outlined,
                            ),
                          ),
                          IconInputField(
                            placeholderText: "confirm_password".tr,
                            fieldController: _confirmPasswordController,
                            fieldPaddingleft: 20,
                            fieldPaddingright: 20,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            prefixIcon: Icon(
                              Icons.lock_outlined,
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
                              Get.to(SplashScreen());
                            },
                            backgroundColor: AppConstants.subTextGrey,
                            foregroundColor: AppConstants.siteSubColor,
                            elevation: 2,
                          ),
                        ],
                      ),
                    ),

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
                            fieldController: _emailController,
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

                              dropDownList: const [
                                DropDownValueModel(name: 'Male', value: 0),
                                DropDownValueModel(
                                  name: 'Female',
                                  value: 1,
                                ),
                              ],
                              onChanged: (val) {},
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
                              Get.to(SplashScreen());
                            },
                            backgroundColor: AppConstants.subTextGrey,
                            foregroundColor: AppConstants.siteSubColor,
                            elevation: 2,
                          ),
                        ],
                      ),
                    )
                  ]),
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
                          style: TextStyle(color: Colors.grey, fontSize: 18),
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
          ),
        ),
      ),
    );
  }
}
