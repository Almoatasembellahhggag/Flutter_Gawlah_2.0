import 'package:flutter/material.dart';

class TextLink1 extends StatelessWidget {
  final String text;
  final Function onPressed;
  const TextLink1(this.text, {this.onPressed});
 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14,color: Colors.black),
      ),
    );
  }
}
