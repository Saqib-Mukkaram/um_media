import 'dart:convert';

class RoosterImages {
  final int id;
  final int roster_id;
  final String image;

  RoosterImages(
      {required this.id, required this.image, required this.roster_id});

  factory RoosterImages.fromjson(Map<String, dynamic> json) {
    return RoosterImages(
        id: json['id'], image: json['image'], roster_id: json['roster_id']);
  }
}
