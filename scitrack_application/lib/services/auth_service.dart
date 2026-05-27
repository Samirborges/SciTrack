import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  static Future<void> registerUser({
    required String email,
    required String password,
  }) async {

    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }


  static Future<bool> login({
    required String email,
    required String password,
  }) async {

    final prefs =
        await SharedPreferences.getInstance();

    final savedEmail =
        prefs.getString('email');

    final savedPassword =
        prefs.getString('password');

    return (
      email == savedEmail &&
      password == savedPassword
    );
  }
}