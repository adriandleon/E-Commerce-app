import 'package:e_commercial/screens/sign_up.dart';
import 'package:e_commercial/utils.dart';
import 'package:e_commercial/widgets/centered_title.dart';
import 'package:e_commercial/widgets/change_screen.dart';
import 'package:e_commercial/widgets/my_text_form_field.dart';
import 'package:e_commercial/widgets/password_form_field.dart';
import 'package:flutter/material.dart';
import '../widgets/my_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

bool obscurePassword = false;

class _LoginState extends State<Login> {
  void validation() {
    final FormState _form = _formKey.currentState;
    if (_form.validate()) {
      print('Yes');
    } else {
      print('No');
    }
  }

  Widget _buildAllForm() {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CenteredTitle(text: 'Login'),
          MyTextFormField(
            hint: 'Email',
            validator: (value) {
              if (value.isEmpty) {
                return "Please fill email";
              } else if (!validateEmail(value)) {
                return "Email is invalid";
              } else {
                return "";
              }
            },
          ),
          PasswordFormField(
            hint: 'Password',
            obscurePassword: obscurePassword,
            validator: (value) {
              if (value == "") {
                return "Please fill password";
              } else if (value.length < 8) {
                return "Password is too short";
              } else {
                return "";
              }
            },
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
          ),
          MyButton(
            onPressed: () => validation(),
            name: 'Login',
          ),
          ChangeScreen(
            name: 'SignUp',
            whichScreen: 'I have not account!',
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => SignUp(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAllForm(),
            ],
          ),
        ),
      ),
    );
  }
}
