import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hint;
  final Function validator;

  MyTextFormField({this.hint, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
