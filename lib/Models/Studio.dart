import 'package:flutter/material.dart';

class Studio {
  final int id;
  final int studioId;
  final String image;


  Studio({
    required this.id,
    required this.studioId,
    required this.image
  });
  factory Studio.fromJson(Map<String, dynamic> json) {
    return Studio(
      id: json['id'],
      studioId: json['studio_id'],
      image: json['image'] ?? '',
    );
  }
}
// class Studio {
//   final int id;
//   final String image;
//   final String name;
//   final String description;
//   final String size;
//   final String address;
//   final String priceLess6;
//   final String priceMore6;
//   final int? userId;
//   final int isActive;
//   final DateTime? deletedAt;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final List<GalleryItem> gallery;

//   Studio({
//     required this.id,
//     required this.image,
//     required this.name,
//     required this.description,
//     required this.size,
//     required this.address,
//     required this.priceLess6,
//     required this.priceMore6,
//     this.userId,
//     required this.isActive,
//     this.deletedAt,
//     this.createdAt,
//     this.updatedAt,
//     required this.gallery,
//   });

//   factory Studio.fromJson(Map<String, dynamic> json) {
//     List<GalleryItem> galleryItems = [];
//     if (json['gallery'] != null) {
//       galleryItems = List<GalleryItem>.from(
//         json['gallery'].map((galleryData) => GalleryItem.fromJson(galleryData)),
//       );
//     }

//     return Studio(
//       id: json['id'],
//       image: json['image'],
//       name: json['name'],
//       description: json['description'],
//       size: json['size'],
//       address: json['address'],
//       priceLess6: json['price_less_6'],
//       priceMore6: json['price_more_6'],
//       userId: json['user_id'],
//       isActive: json['is_active'],
//       deletedAt: json['deleted_at'] != null
//           ? DateTime.parse(json['deleted_at'])
//           : null,
//       createdAt: json['created_at'] != null
//           ? DateTime.parse(json['created_at'])
//           : null,
//       updatedAt: json['updated_at'] != null
//           ? DateTime.parse(json['updated_at'])
//           : null,
//       gallery: galleryItems,
//     );
//   }
// }

// class GalleryItem {
//   final int id;
//   final int studioId;
//   final String image;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;

//   GalleryItem({
//     required this.id,
//     required this.studioId,
//     required this.image,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory GalleryItem.fromJson(Map<String, dynamic> json) {
//     return GalleryItem(
//       id: json['id'],
//       studioId: json['studio_id'],
//       image: json['image'],
//       createdAt: json['created_at'] != null
//           ? DateTime.parse(json['created_at'])
//           : null,
//       updatedAt: json['updated_at'] != null
//           ? DateTime.parse(json['updated_at'])
//           : null,
//     );
//   }
// }
