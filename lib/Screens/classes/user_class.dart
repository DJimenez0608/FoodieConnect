import 'package:uuid/uuid.dart';

class UserC {
  final String email;
  final String password;
  final String name;
  final String? country;
  final String? birthday;

  UserC({
    required this.email,
    required this.password,
    required this.name,
    required this.country,
    required this.birthday,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'country': country,
      'birthday': birthday
    };
  }
}
