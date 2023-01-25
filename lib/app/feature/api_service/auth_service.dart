import 'dart:convert';

import 'package:netpace/app/feature/api_service/base_service.dart';
import 'package:netpace/app/feature/api_service/http_request.dart';
import 'package:netpace/app/feature/data/api_response/api_response.dart';
import 'package:http/http.dart' as http;

class AuthService extends BaseService {
  Future<ApiResponse> loginUser(String email, String password) async {
    final body = jsonEncode({"email": email, "password": password});
    final http.Response response = await post(
      Uri.parse("${super.baseUrl}api/user-management/auth/producer"),
      body: body,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
    final responseBody = jsonDecode(response.body);
    return ApiResponse.fromJson(responseBody);
  }

  Future<ApiResponse> signupUser(String email, String password, String username) async {
    final body = jsonEncode({"email": email, "password": password , "username":username});
    final http.Response response = await post(
      Uri.parse("${super.baseUrl}api/user-management/complain-producer/"),
      body: body,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
    final responseBody = jsonDecode(response.body);
    return ApiResponse.fromJson(responseBody);
  }
}
