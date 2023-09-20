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
  final List<String> interests;
  final List<String> galleryImages;

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
    required this.interests,
    required this.galleryImages,
  });

  factory Rooster.fromJson(Map<String, dynamic> json) {
    // Extract interest names from the JSON data
    List<String> interests = [];
    for (var interest in json['interest']) {
      interests.add(interest['name']);
    }

    // Extract gallery image paths from the JSON data
    List<String> galleryImages = [];
    for (var image in json['gallery']) {
      galleryImages.add(image['image']);
    }

    return Rooster(
      id: json['data']['id'],
      firstName: json['data']['first_name'],
      lastName: json['data']['last_name'],
      gender: json['data']['gender'],
      phone: json['data']['phone'],
      email: json['data']['email'],
      city: json['data']['city'],
      state: json['data']['state'],
      country: json['data']['country'],
      dob: json['data']['dob'],
      interests: interests,
      galleryImages: galleryImages,
    );
  }
}
