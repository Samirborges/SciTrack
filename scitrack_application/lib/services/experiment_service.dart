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

  static Future<List<Map<String, dynamic>>> getExperiments() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> experiments = prefs.getStringList(key) ?? [];

    return experiments.map((item) {
      return jsonDecode(item) as Map<String, dynamic>;
    }).toList();
  }

  static Future<void> deleteExperiment(
    int index,
  ) async {

    final prefs =
        await SharedPreferences.getInstance();

    List<String> experiments =
        prefs.getStringList(key) ?? [];

    experiments.removeAt(index);

    await prefs.setStringList(
      key,
      experiments,
    );
  }


  static Future<void> updateExperiment({

    required int index,

    required Map<String, dynamic> data,

  }) async {

    final prefs =
        await SharedPreferences.getInstance();

    List<String> experiments =
        prefs.getStringList(key) ?? [];

    experiments[index] =
        jsonEncode(data);

    await prefs.setStringList(
      key,
      experiments,
    );
  }
}
