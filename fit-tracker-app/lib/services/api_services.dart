import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:5000/api/fitness";

  static Future<Map<String, dynamic>> updateProgress(
    int steps,
    int heartPoints,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/update"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"steps": steps, "heartPoints": heartPoints}),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data;
      }
    } catch (e) {
      print("Exception: $e");
    }
    return {"progress": 0.0, "steps": 0, "heartPoints": 0};
  }
}
