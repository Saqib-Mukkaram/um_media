import 'dart:io';

class Register {
  String? firstname;
  String? lastName;
  String? gender;
  String? city;
  String? state;
  String? country;
  String? email;
  String? password;
  String? phone;
  String? dob;
  List<int>? interests;
  File? profileImage;

  Register({
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
  });
}
