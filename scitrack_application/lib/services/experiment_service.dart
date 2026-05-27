import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ExperimentService {
  static const String key = 'experiments';

  static Future<void> saveExperiment({
    required Map<String, dynamic> data,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> experiments = prefs.getStringList(key) ?? [];

    experiments.add(jsonEncode(data));

    await prefs.setStringList(key, experiments);
  }
}
