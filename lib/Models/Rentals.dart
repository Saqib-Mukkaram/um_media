class Rentals {
  final int id;
  final String name;
  final String image;
  final String type;

  Rentals({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
  });
//fromjson
  factory Rentals.fromJson(Map<String, dynamic> json) {
    return Rentals(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      type: json['category_type'],
    );
  }
}
