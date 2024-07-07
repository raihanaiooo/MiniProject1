import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/profile_model.dart';

class ProfileService {
  final String url = 'https://fakestoreapi.com/users/1';

  Future<Profile> fetchProfile() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Profile.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load profile');
    }
  }
}
