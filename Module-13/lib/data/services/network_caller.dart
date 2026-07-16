import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../models/network_response.dart';
import '../utils/auth_utility.dart';

class NetworkCaller {
  // Global key to navigate without context on 401 Unauthorized errors
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<NetworkResponse> getRequest(String url) async {
    try {
      log('GET Request URL: $url');
      Response response = await get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'token': AuthUtility.token ?? '',
        },
      );
      log('GET Response Code: ${response.statusCode}');
      log('GET Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedData,
        );
      } else if (response.statusCode == 401) {
        _redirectToLogin();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: 'Unauthorized access',
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      log('GET Request Error: $e');
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body) async {
    try {
      log('POST Request URL: $url');
      log('POST Request Body: $body');
      Response response = await post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'token': AuthUtility.token ?? '',
        },
        body: jsonEncode(body),
      );
      log('POST Response Code: ${response.statusCode}');
      log('POST Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedData,
        );
      } else if (response.statusCode == 401) {
        _redirectToLogin();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: 'Unauthorized access',
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      log('POST Request Error: $e');
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static void _redirectToLogin() async {
    await AuthUtility.clearUserInfo();
    navigatorKey.currentState?.pushNamedAndRemoveUntil('/login', (route) => false);
  }
}
