import 'dart:convert';

import 'package:colorbracket_assignment/data/models/employee_model.dart';
import 'package:colorbracket_assignment/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserNetworkService {
  Future<int> validateUser(String email, String password) async {
    String baseUrl =
        "https://retoolapi.dev/B13laa/getusers?user_id=$email&password=$password";
    final response = await http.get(Uri.parse(baseUrl));
    final decodedResponse = jsonDecode(response.body) as List;
    if (decodedResponse.isNotEmpty) {
      return 200;
    } else {
      return 404;
    }
  }

  Future<List<dynamic>> fetchEmployeeList() async {
    String baseUrl = "https://retoolapi.dev/GFHqAV/getemployees";
    final response = await http.get(Uri.parse(baseUrl));
    final decodedResponse = jsonDecode(response.body) as List;

    return decodedResponse;
  }

  Future<dynamic> fetchEmployeeReadMore(int id) async {
    String baseUrl = "https://retoolapi.dev/H2F0Ui/getemployedetail?id=$id";
    final response = await http.get(Uri.parse(baseUrl));
    final decodedResponse = jsonDecode(response.body);
    // print(decodedResponse);
    return decodedResponse;
  }
}
