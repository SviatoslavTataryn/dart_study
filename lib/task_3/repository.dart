import 'dart:convert';
import 'dart:io';
import 'model.dart';

class DataLoader {
  static Future<Map<int, TimeEvent>> loadTimeEvents(String filePath) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        throw Exception("Файл $filePath не існує");
      }

      final jsonString = await file.readAsString();
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;

      Map<int, TimeEvent> events = {};

      jsonData.forEach((key, value) {
        events[int.parse(key)] = TimeEvent.fromJson(value);
      });

      return events;
    } catch (e) {
      print("Помилка при завантаженні часових подій: $e");
      return {};
    }
  }

  static Future<List<Discovery>> loadDiscoveries(String filePath) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        throw Exception("Файл $filePath не існує");
      }

      final jsonString = await file.readAsString();
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;

      List<Discovery> discoveries = [];

      jsonData.forEach((key, value) {
        discoveries.add(Discovery.fromJson(value));
      });

      return discoveries;
    } catch (e) {
      print("Помилка при завантаженні відкриттів: $e");
      return [];
    }
  }
}
