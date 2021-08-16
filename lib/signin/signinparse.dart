import 'package:meta/meta.dart';
import 'dart:convert';

SignInParse signInParseFromJson(String str) => SignInParse.fromJson(json.decode(str));

String signInParseToJson(SignInParse data) => json.encode(data.toJson());

class SignInParse {
  SignInParse({
    required this.success,
  });

  String success;

  factory SignInParse.fromJson(Map<String, dynamic> json) => SignInParse(
    success: json["Success"],
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
  };
}