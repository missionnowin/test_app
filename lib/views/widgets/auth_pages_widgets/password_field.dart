import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PasswordField extends StatefulWidget{
  TextEditingController _passwordController;
  PasswordField(this._passwordController, {Key? key}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState(_passwordController);
}

class _PasswordFieldState extends State<PasswordField>{
  _PasswordFieldState(this._passwordController);

  bool _isHidden = true;
  TextEditingController _passwordController;

  @override
  Widget build(BuildContext context){
    return FormBuildeFrTextField(

    )
  }
}