import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://localhost:8080/api/v1";
  Future<dynamic> loginAPI(String username, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/user/signin'),
        body: {"username": username, "password": password});
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
