import 'dart:convert';

class User {
  final int id;
  final String email, firstName, lastName, phoneNumber;

  final bool isActive;
  final String profilePicture;
  final String country;
  final String unit;
  final String role;
  final String unitAbbreviation;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.isActive,
    required this.profilePicture,
    required this.country,
    required this.unit,
    required this.role,
    required this.unitAbbreviation,
  });

  static User fromMap(Map<String, dynamic> data) {
    return User(
      id: data['id'] as int,
      firstName: data['first_name'] as String,
      lastName: data['last_name'] as String,
      email: data['email'] as String,
      phoneNumber: data["phone_number"] as String,
      country: data["country"]["name"],
      unit: data["unit"]["name"],
      unitAbbreviation: data["unit"]["abbreviation"],
      role: data["role"] as String,
      isActive: data['is_active'] as bool,
      profilePicture: data['profile_picture'] ?? "",
    );
  }

  static List<User> fromJSONList(String jsonString) {
    final List<Map<String, dynamic>> data =
        (json.decode(jsonString) as List<dynamic>)
            .map((e) => e as Map<String, dynamic>)
            .toList();
    return data.map((e) => User.fromMap(e)).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      "id": 1,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone_number": phoneNumber,
      "is_active": isActive,
    };
  }

  String toJSON() {
    return json.encode(toMap());
  }
}
