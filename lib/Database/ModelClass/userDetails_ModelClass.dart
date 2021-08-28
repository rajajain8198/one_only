import 'package:floor/floor.dart';

@entity
class UserDetailsModelClass {
  @primaryKey
  final String email;
  final String name;
  final String mobileNumber;
  final String password;

  UserDetailsModelClass(
      this.email, this.name, this.mobileNumber, this.password);

  UserDetailsModelClass.fromMap(Map<String, dynamic> res)
      : email = res["email"],
        name = res["name"],
        mobileNumber = res["mobileNumber"],
        password = res["password"];

  Map<String, Object?> toMap() {
    return {
      'email': email,
      'name': name,
      'mobileNumber': mobileNumber,
      'password': password,
    };
  }
}
