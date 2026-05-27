import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<void> registerUser({
    required String name,
    required String institution,
    required String researchArea,
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', name);
    await prefs.setString('institution', institution);
    await prefs.setString('researchArea', researchArea);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final savedEmail = prefs.getString('email');

    final savedPassword = prefs.getString('password');

    return (email == savedEmail && password == savedPassword);
  }

  static Future<Map<String, String>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();

    return {
      'name': prefs.getString('name') ?? '',

      'institution': prefs.getString('institution') ?? '',

      'researchArea': prefs.getString('researchArea') ?? '',

      'email': prefs.getString('email') ?? '',
    };
  }

  static Future<void> updateProfile({
    required String name,
    required String institution,
    required String researchArea,
    required String email,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', name);

    await prefs.setString('institution', institution);

    await prefs.setString('researchArea', researchArea);

    await prefs.setString('email', email);
  }
}
