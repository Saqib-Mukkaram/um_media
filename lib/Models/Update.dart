import 'dart:io';

class Update {
  int? id;
  String? firstname;
  String? lastName;
  String? gender;
  String? city;
  String? state;
  String? country;
  String? email;
  String? password;
  String? height;
  String? weight;
  String? phone;
  String? dob;
  List<String>? interests;
  File? profileImage;
  List<dynamic>? galleryImage;

  Update({
    this.id,
    this.firstname,
    this.lastName,
    this.gender,
    this.city,
    this.state,
    this.country,
    this.email,
    this.password,
    this.phone,
    this.dob,
    this.interests,
    this.profileImage,
    this.galleryImage,
    this.height,
    this.weight,
  });
}
