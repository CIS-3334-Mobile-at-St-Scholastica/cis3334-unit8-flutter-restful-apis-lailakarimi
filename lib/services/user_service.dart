import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data_models/user.dart';

class UserService {
  // Replace this URL with your API endpoint
  final String url = "https://jsonplaceholder.typicode.com/users";

  Future<List<Welcome>> fetchUsers() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => Welcome.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
