import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  final String hint;
  final bool obscurePassword;
  final Function validator;
  final Function onTap;

  PasswordFormField(
      {this.hint, this.obscurePassword, this.validator, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscurePassword,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint,
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
            obscurePassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
