import 'package:e_commercial/screens/login.dart';
import 'package:e_commercial/utils.dart';
import 'package:e_commercial/widgets/centered_title.dart';
import 'package:e_commercial/widgets/change_screen.dart';
import 'package:e_commercial/widgets/my_button.dart';
import 'package:e_commercial/widgets/my_text_form_field.dart';
import 'package:e_commercial/widgets/password_form_field.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

bool passwordVisible = false;

class _SignUpState extends State<SignUp> {
  void validation() {
    final FormState _form = _formKey.currentState;
    if (_form.validate()) {
      print('Yes');
    } else {
      print('No');
    }
  }

  Widget _buildAllTextFormFields() {
    return Container(
      height: 330,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextFormField(
            hint: 'UserName',
            validator: (value) {
              if (value == "") {
                return "Please fill UserName";
              } else if (value.length < 6) {
                return "UserName is too short";
              }
              return "";
            },
          ),
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
          MyTextFormField(
            hint: 'Phone Number',
            validator: (value) {
              if (value.isEmpty) {
                return "Please fill phone number";
              } else if (value.length < 11) {
                return "Phone number must be 11";
              } else {
                return "";
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      height: 400,
      margin: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormFields(),
          MyButton(
            name: 'SignUp',
            onPressed: () => validation(),
          ),
          ChangeScreen(
            name: 'Login',
            whichScreen: 'I have already an account!',
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => Login(),
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 220,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CenteredTitle(
                        text: 'Register',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildBottomPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
