class TalentCategory {
  final int id;
  final String name;
  final String photo;
  final int isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  TalentCategory({
    required this.id,
    required this.name,
    required this.photo,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TalentCategory.fromJson(Map<String, dynamic> json) {
    return TalentCategory(
        id: json['id'],
        name: json['name'],
        photo: json['photo'],
        isActive: json['is_active'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']));
  }
}
