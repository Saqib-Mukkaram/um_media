// import 'package:json_annotation/json_annotation.dart';
// part 'user_profile.g.dart';


// @JsonSerializable()
// class UserProfile {
//   final int id;
//   final String firstName;
//   final String lastName;
//   final String gender;
//   final String phone;
//   final String email;
//   final String city;
//   final String state;
//   final String country;
//   final String dob;
//   final String profileImage;
 
//  @JsonKey(fromJson: _interestListFromJson)
// final List<Interest> interest;

// static List<Interest> _interestListFromJson(List<dynamic> json) {
//   return json.map((interestJson) => Interest.fromJson(interestJson)).toList();
// }
// @JsonKey(fromJson: _galleryListFromJson)
// final List<GalleryItem> gallery;

// static List<GalleryItem> _galleryListFromJson(List<dynamic> json) {
//   return json.map((galleryJson) => GalleryItem.fromJson(galleryJson)).toList();
// }

  
//   UserProfile({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.gender,
//     required this.phone,
//     required this.email,
//     required this.city,
//     required this.state,
//     required this.country,
//     required this.dob,
//     required this.profileImage,
//     required this.interest,
//     required this.gallery,
//   });

//   // Add any other methods or constructors you may need.
//  Map<String, dynamic> interestsToJson() {
//   return {
//     'id': id,
//     'firstName': firstName,
//     'lastName': lastName,
//     'gender': gender,
//     'phone': phone,
//     'email': email,
//     'city': city,
//     'state': state,
//     'country': country,
//     'dob': dob,
//     'profileImage': profileImage,
//     'interest': interest.map((item) => item.interestsToJson()).toList(),
//     // Add other properties as needed
//   };
// }

// Map<String, dynamic> galleryToJson() {
//   return {
//     'id': id,
//     'firstName': firstName,
//     'lastName': lastName,
//     'gender': gender,
//     'phone': phone,
//     'email': email,
//     'city': city,
//     'state': state,
//     'country': country,
//     'dob': dob,
//     'profileImage': profileImage,
//     'interest': interest.map((item) => item.interestsToJson()).toList(),
//     'gallery': gallery.map((item) => item.galleryToJson()).toList(),
//     // Add other properties as needed
//   };
// }

// }



// class Interest {
//   final int id;
//   final String name;
//   final String photo;

//   Interest({
//     required this.id,
//     required this.name,
//     required this.photo,
//   });
//   Map<String, dynamic> interestsToJson() {
//   return {
//     'id': id,
//     'name': name,
//     'photo': photo,
//   };
// }

//   factory Interest.fromJson(Map<String, dynamic> json) {
//   return Interest(
//     id: json['id'] as int,
//     name: json['name'] as String,
//     photo: json['photo'] as String,
//   );
// }

// }

// class GalleryItem {
//   final int id;
//   final int rosterId;
//   final String image;

//   GalleryItem({
//     required this.id,
//     required this.rosterId,
//     required this.image,
//   });

//   Map<String, dynamic> galleryToJson() {
//   return {
//     'id': id,
//     'roster_id': rosterId,
//     'image': image,
//   };
// }

//   factory GalleryItem.fromJson(Map<String, dynamic> json) {
//   return GalleryItem(
//     id: json['id'] as int,
//     rosterId: json['roster_id'] as int,
//     image: json['image'] as String,
//   );
// }

// }
