

import 'dart:convert';

import 'package:netpace/app/feature/api_service/base_service.dart';
import 'package:netpace/app/feature/data/api_response/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:netpace/app/feature/data/model/location.dart';
import 'package:netpace/app/feature/data/model/type.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'http_request.dart';

class ComplainService extends BaseService
{
  Future<ApiResponse> getComplains() async {
    final http.Response response = await get(
      Uri.parse("${super.baseUrl}api/complain-management/complain/"),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
    final responseBody = jsonDecode(response.body);
    return ApiResponse.fromJson(responseBody);
  }

  Future<ApiResponse> getLocations() async {
    final http.Response response = await get(
      Uri.parse("${super.baseUrl}api/complain-management/complain-location/"),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
    final responseBody = jsonDecode(response.body);
    return ApiResponse.fromJson(responseBody);
  }

  Future<ApiResponse> getTypes() async {
    final http.Response response = await get(
      Uri.parse("${super.baseUrl}api/complain-management/complain-type/"),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
    final responseBody = jsonDecode(response.body);
    return ApiResponse.fromJson(responseBody);
  }


  Future<ApiResponse> addComplain(String title , String desc , Location loc , ComplainType type) async {
    final prefs = await SharedPreferences.getInstance();
    final body = jsonEncode({
      "complainTitle": title,
      "status": "Issued",
      "discription": desc,
      "complainProducer": "63cd706fce190dac0c868155",
      "complainConsumer":  prefs.get("userId"),
      "complainType": type.id,
      "complainLocation": loc.id
    });

    final http.Response response = await post(
      Uri.parse("${super.baseUrl}api/complain-management/complain/"),
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