class RosterData {
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
  final String weight;
  final String height;

  RosterData(
      {required this.id,
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
      required this.height
      });

  factory RosterData.fromJson(Map<String, dynamic> json) {
    return RosterData(
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
        height: json['height']
        );
  }
}
