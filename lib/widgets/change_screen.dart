import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  final String name;
  final String whichScreen;
  final Function onTap;

  ChangeScreen({this.name, this.onTap, this.whichScreen});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(whichScreen),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            name,
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
