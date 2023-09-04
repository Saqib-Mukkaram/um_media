import 'package:flutter/material.dart';

class AppConstants {
  //Colors
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color login_text = Color.fromARGB(100, 131, 131, 131);
  static const Color inputFieldLabel = Color.fromARGB(100, 237, 237, 237);
  static const Color checkBoxColor = Color.fromARGB(100, 73, 154, 241);
  static const Color loginButton = Color.fromARGB(255, 73, 154, 241);
  static const Color dividerColor = Color.fromARGB(255, 217, 217, 217);

  //Paths
  static const String Logo = "assets/imgs/Logo.png";
  static const String google_icon = "assets/imgs/icons/Google.png";

  //API Paths
  static const String base_URL = "https://localhost:7288/";
  static const String register = "api/register";
  static const String login = "api/login";
}
