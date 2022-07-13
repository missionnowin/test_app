import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:test_app/views/widgets/auth_pages_widgets/password_field.dart';
import 'package:test_app/views/widgets/custom_text_field.dart';

import '../../../service/router/app_router.dart';

class AuthForm extends StatelessWidget{
  const AuthForm({Key? key, required this.onConfirm}) : super(key: key);

  final void Function(BuildContext, Map<String, dynamic>) onConfirm;
  static final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: <Widget>[
          CustomFormTextField(
              action: TextInputAction.next,
              name: 'email',
              label: 'E-mail / Номер телефонра',
              validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле'),
          ),
          const SizedBox(height: 6.0),
          const PasswordField(),
          const SizedBox(height: 60),
          Container(
            alignment: Alignment.center,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: const Color(0xFF009ED1),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: TextButton(
                      onPressed: (){
                          final formState = _formKey.currentState!;
                          formState.save();
                          if (formState.validate()) {
                            onConfirm(context, formState.value);
                          }
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 64,
                        child: const Text(
                          'Войти в аккаунт',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: '.SF UI Display',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                )
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              child: DecoratedBox(
                decoration: BoxDecoration(
                color: const Color(0xFFE9EEF1),
                borderRadius: BorderRadius.circular(10.0)
                ),
                child: TextButton(
                  onPressed: (){
                  AutoRouter.of(context).push(const RegistrationPageRoute());
                },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 64,
                    child: const Text(
                      'Нет аккаунта? Регистрация',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: '.SF UI Display',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF617088),
                      ),
                    ),
                  ),
                ),
              )
            ),
            const SizedBox(
              height: 13,
            ),
            const TextButton(
              onPressed: null,
              child: Text(
                'Забыли пароль?',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: '.SF UI Display',
                    color: Color(0xFF617088),
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ),
        ],
      )
    );
  }
}