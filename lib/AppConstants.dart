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
  static const String img_actor = "assets/imgs/Actor.jpg";
  static const String img_dancing = "assets/imgs/Dancing.jpg";
  static const String img_singing = "assets/imgs/Singing.jpg";
  static const String img_photography = "assets\\imgs\\Photography.jpg";
  static const String google_icon = "assets/imgs/icons/Google.png";
  static const String img_person = "assets/imgs/Person.jpg";

  //Network Paths
  static const String net_actor =
      "http://ummediagroup.com/assets/images/categories/actor.jpg";
  static const String net_photographer =
      "http://ummediagroup.com/assets/images/categories/photography.jpg";
  static const String net_dancing =
      "http://ummediagroup.com/assets/images/categories/dancers.jpg";
  static const String net_YT =
      "http://ummediagroup.com/assets/images/categories/youtuber.jpg";
  static const String net_singing =
      "http://ummediagroup.com/assets/images/categories/singer.jpg";
  static const String net_musician =
      "http://ummediagroup.com/assets/images/categories/musician.jpg";
  static const String net_dj =
      "http://ummediagroup.com/assets/images/categories/dj.jpg";

  //API Paths
  static const String base_URL = "https://localhost:7288/";
  static const String register = "api/register";
  static const String login = "api/login";
}
