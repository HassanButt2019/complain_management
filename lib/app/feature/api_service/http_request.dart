import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netpace/initializers.dart';


Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
  try {
    final response = await http.get(url, headers: headers);

    print(response.body);
    handleExceptions(response.body);
    return response;
  } on SocketException catch (error) {
    return http.Response(error.message, 400);
  } on TimeoutException catch (e) {
    return http.Response(e.message.toString(), 408);
  } on Error catch (e) {
    return http.Response(e.toString(), 400);
  }
}

Future<http.Response> post(Uri url,
    {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
  try {
    final response =
        await http.post(url, headers: headers, body: body, encoding: encoding);

    handleExceptions(response.body);
    return response;
  } on SocketException catch (error) {
    return http.Response(error.message, 400);
  } on TimeoutException catch (e) {
    return http.Response(e.message.toString(), 408);
  } on Error catch (e) {
    return http.Response(e.toString(), 400);
  }
}

void handleExceptions(String response) async {

  final responseBody = jsonDecode(response);
  if (responseBody["errors"] != null) {
    snackbarKey.currentState?.hideCurrentSnackBar();
    snackbarKey.currentState?.showSnackBar(SnackBar(content: Text(responseBody["error"])));

  }
}
