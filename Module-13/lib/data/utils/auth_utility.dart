import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthUtility {
  static String? token;
  static UserModel? userInfo;

  static Future<void> saveUserInfo(String userToken, UserModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', userToken);
    await sharedPreferences.setString('user-info', jsonEncode(model.toJson()));
    token = userToken;
    userInfo = model;
  }

  static Future<void> updateUserInfo(UserModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('user-info', jsonEncode(model.toJson()));
    userInfo = model;
  }

  static Future<void> getUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    String? user = sharedPreferences.getString('user-info');
    if (user != null) {
      userInfo = UserModel.fromJson(jsonDecode(user));
    }
  }

  static Future<void> clearUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    token = null;
    userInfo = null;
  }

  static bool get checkIfUserLoggedIn {
    return token != null;
  }
}
