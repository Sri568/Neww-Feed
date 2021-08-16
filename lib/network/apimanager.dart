import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsfeed/home/newsparse.dart';

class APIManager {
  Future signInNetworkCall(String userName, String password) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final msg = jsonEncode({
      "email": userName,
      "password": password

    });
    var url = Uri.parse('https://nodejs-register-login-app.herokuapp.com/login');
    var response = await http.post(url, headers: headers, body: msg);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return jsonDecode(response.body);
  }

  Future<NewsParse> newsCall() async{
    var url = Uri.parse('https://api.first.org/data/v1/news');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return NewsParse.fromJson(jsonDecode(response.body));
  }
}