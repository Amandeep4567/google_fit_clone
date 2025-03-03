import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:5000/api/fitness";

  static Future<double> updateProgress(int steps, int heartPoints) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/update"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"steps": steps, "heartPoints": heartPoints}),
      );

      print("Response: ${response.body}");

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data != null && data.containsKey("progress")) {
          return data["progress"].toDouble();
        }
      }

      print("Invalid response: ${response.body}");
      return 0.0;
    } catch (e) {
      print("Exception: $e");
      return 0.0;
    }
  }
}
