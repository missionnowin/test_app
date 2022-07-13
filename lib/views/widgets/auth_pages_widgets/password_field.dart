import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../custom_text_field.dart';

class PasswordField extends StatefulWidget{
  const PasswordField({Key? key}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField>{
  bool _isObscure= true;

  @override
  Widget build(BuildContext context) {
    return CustomFormTextField(
      label: 'Пароль',
      name: 'password',
      action: TextInputAction.done,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context,
            errorText: 'Необходимо заполнить поле',
        )]),
      obscureText: _isObscure,
      suffixIcon: IconButton(
        icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState((){
            _isObscure = !_isObscure;
          });
        },
      ),
    );
  }
}