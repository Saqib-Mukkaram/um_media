import 'package:get/get.dart';
import 'package:um_media/Models/RoosterImages.dart';
import 'package:um_media/Models/RoosterInterests.dart';

class RoosterData {
  final int id;
  final String firstName;
  final String lastName;
  final String gender;
  final String phone;
  final String email;
  final String city;
  final String state;
  final String country;
  final String dob;
  final String profile_image;
  final String? weight;
  final String? height;

  RoosterData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.phone,
    required this.email,
    required this.city,
    required this.state,
    required this.country,
    required this.dob,
    required this.profile_image,
    required this.weight,
    required this.height,
  });

  factory RoosterData.fromJson(Map<String, dynamic> json) {
    return RoosterData(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      phone: json['phone'],
      email: json['email'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      dob: json['dob'],
      profile_image: json['profile_image'],
      weight: json['weight'],
      height: json['height'],
    );
  }
}

class Rooster {
  final int id;
  final String firstName;
  final String lastName;
  final String gender;
  final String phone;
  final String email;
  final String city;
  final String state;
  final String country;
  final String dob;
  final String? weight;
  final String? height;
  final String profileImage;
  final List<Interest> interests;
  final List<GalleryImage> gallery;
  var IsEnquired = false.obs;

  Rooster({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.phone,
    required this.email,
    required this.city,
    required this.state,
    required this.country,
    required this.dob,
    required this.profileImage,
    required this.interests,
    required this.gallery,
    required this.weight,
    required this.height,
  });

  factory Rooster.fromJson(Map<String, dynamic> json) {
    return Rooster(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      phone: json['phone'],
      email: json['email'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      dob: json['dob'],
      weight: json['weight'],
      height: json['height'],
      profileImage: json['profile_image'],
      interests: (json['interest'] as List<dynamic>)
          .map((interest) => Interest.fromJson(interest))
          .toList(),
      gallery: (json['gallery'] as List<dynamic>)
          .map((galleryImage) => GalleryImage.fromJson(galleryImage))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'phone': phone,
      'email': email,
      'city': city,
      'state': state,
      'country': country,
      'dob': dob,
      'profile_image': profileImage,
      'interests': interests.map((interest) => interest.toJson()).toList(),
      'gallery': gallery.map((galleryImage) => galleryImage.toJson()).toList(),
      'is_enquired': IsEnquired,
    };
  }
}

class Interest {
  final int id;
  final String name;
  final String photo;

  Interest({
    required this.id,
    required this.name,
    required this.photo,
  });

  factory Interest.fromJson(Map<String, dynamic> json) {
    return Interest(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'photo': photo,
    };
  }
}

class GalleryImage {
  final int id;
  final int rosterId;
  final String image;

  GalleryImage({
    required this.id,
    required this.rosterId,
    required this.image,
  });

  factory GalleryImage.fromJson(Map<String, dynamic> json) {
    return GalleryImage(
      id: json['id'],
      rosterId: json['roster_id'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roster_id': rosterId,
      'image': image,
    };
  }
}
