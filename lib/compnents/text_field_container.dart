import 'package:flutter/material.dart';
class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
      width: size.width*0.8,
      decoration: BoxDecoration(
        color: Colors.grey.shade500,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

