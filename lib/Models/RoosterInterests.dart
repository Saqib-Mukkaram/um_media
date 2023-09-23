class RoosterInterests {
  final int roosterId;
  final String name;
  final int isActive;

  RoosterInterests({
    required this.roosterId,
    required this.name,
    required this.isActive,
  });

  factory RoosterInterests.fromJson(Map<String, dynamic> json) {
    return RoosterInterests(
      roosterId: json['pivot']['roster_id'], // Use 'id' from the JSON instead of 'pivot.rooster_id'
      name: json['name'], // 'name' is the name of the interest
      isActive: json['is_active'],
    );
  }
}
