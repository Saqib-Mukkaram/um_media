import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class AppConstants {
  //Colors
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color login_text = Color.fromARGB(100, 131, 131, 131);
  static const Color inputFieldLabel = Color.fromARGB(100, 237, 237, 237);
  static const Color checkBoxColor = Color.fromARGB(100, 73, 154, 241);
  static const Color loginButton = Color.fromARGB(255, 73, 154, 241);
  static const Color dividerColor = Color.fromARGB(255, 217, 217, 217);
  static const Color siteSubColor = Color.fromARGB(255, 196, 143, 27);
  static const Color subTextGrey = Color.fromARGB(255, 0, 0, 0);

  //Paths
  static const String Logo = "assets/imgs/Logo.png";
  static const String img_actor = "assets/imgs/Actor.jpg";
  static const String img_dancing = "assets/imgs/Dancing.jpg";
  static const String img_singing = "assets/imgs/Singing.jpg";
  static const String img_photography = "assets\\imgs\\Photography.jpg";
  static const String google_icon = "assets/imgs/icons/Google.png";
  static const String img_person = "assets/imgs/Person.jpg";
  static List<DropDownValueModel> TalentSelectionList = [
    DropDownValueModel(name: "Actor", value: "Actor"),
  ];
  static List<String> selectedOptions = [
    'Actor',
  ];
  static const img_sana = [
    "assets/imgs/People/Sana-1.png",
    "assets/imgs/People/Sana-2.png",
    "assets/imgs/People/Sana-3.png",
    "assets/imgs/People/Sana-4.png",
    "assets/imgs/People/Sana-5.png",
  ];
  static const img_studio = [
    "assets/imgs/Studio/Studio-1.png",
    "assets/imgs/Studio/Studio-2.png",
    "assets/imgs/Studio/Studio-3.png",
    "assets/imgs/Studio/Studio-4.png",
    // "assets/imgs/Studio/Studio-5.png",
  ];
  static const talentlist = [
    "assets/imgs/Actor.png",
    "assets/imgs/Influencer.png",
    "assets/imgs/DJ.png",
    "assets/imgs/Musician.png",
    "assets/imgs/Singing.png",
    "assets/imgs/Youtuber.png",
    "assets/imgs/Dancing.png",
    "assets/imgs/Photographer.png",
  ];

  static const NetworkPaths = {"Actor": ""};
  // Network Paths
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
  static const String API_TOKEN = "e9a3cc12ce4aab1e136b25ad23b06d01";
  static const String base_URL = "http://ummediagroup.com";
  static const String rooster_categories = "/api/roster/categories";
  static const String rooster_details = "/api/roster/details";
  static const String studio_list = "/api/studio";
  static const String studio_details = "/api/studio/details";
  static const String register = "api/register";
  static const String login = "api/login";
  static const String rooster_list = "/api/roster";
  static const httpHeader = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${AppConstants.API_TOKEN}',
  };
}
