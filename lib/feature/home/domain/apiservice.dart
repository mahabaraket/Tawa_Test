import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_tawa/feature/home/presentation/view/home_view.dart';
import 'package:test_tawa/feature/login/signin_screen.dart';

class ApiService {
  static var client = http.Client();

  static Future<bool> login(String email, String password) async {
    try {
      var reqBody = {
        "email": email,
        "password": password,
      };

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json; charset=utf-8',
        // 'Access-Control-Allow-Origin': '*',
        //'Access-Control-Allow-Methods': 'POST',
        'Access-Control-Allow-Headers': 'Content-Type',
      };

      var url = Uri.parse("https://api.staging.tawa.digital/v2/user/signin");

      var response = await client.post(
        url,
        /*   headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Access-Control-Allow-Headers': 'Content-Type',
        }, */
        body: reqBody,
      );
      var jsonResponse = jsonDecode(response.body);
      //print(jsonResponse);
      var data = jsonResponse;
      //print("success: ${data['success']}");
      if (response.statusCode == 200 && data['success']) {
        var myToken = data['data']['token'];
        // print("fff$myToken");
        await _storeToken(myToken);

        return true;
      } else {
        print('Something went wrong !');

        return false;
      }
    } catch (e) {
      print('Erreur: $e');

      return false;
    }
  }

  static Future<void> _storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  static Future<String?> getStoredToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<Map<String, dynamic>?> getUserProfile() async {
    try {
      String? token = await getStoredToken();
      print("dddddddddd$token");

      if (token == null) {
        return null;
      }

      var url = Uri.parse("https://api.staging.tawa.digital/v2/user/getMe");

      var response = await client.get(
        url,
        headers: {"Authorization": "Bearer $token"},
      );
      print("ffffffffff$response");
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse) {
          var userObject = jsonResponse['data']['user'];
          return userObject;
        } else {
          // Handle API response indicating failure
          print('API request failed: ${jsonResponse['message']}');
          return null;
        }
      } else {
        // Handle error
        print('Error fetching user profile: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
