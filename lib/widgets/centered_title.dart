import 'package:flutter/material.dart';

class CenteredTitle extends StatelessWidget {
  final String text;

  CenteredTitle({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
