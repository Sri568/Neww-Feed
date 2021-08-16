import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topRight,
        padding:
        EdgeInsets.symmetric(vertical: 5, horizontal: 45),
        child: Text(
          "Forgot Password?",
          style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline),
        )
    );
  }
}
