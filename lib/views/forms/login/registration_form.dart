import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:test_app/views/widgets/custom_text_field.dart';

class RegistrationForm extends StatelessWidget{
  const RegistrationForm({Key? key, required this.onConfirm}) : super(key: key);

  final void Function(BuildContext, Map<String, dynamic>) onConfirm;
  static final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey, 
      child: Container(
          margin: const EdgeInsets.all(12.0),
          padding: const EdgeInsets.all(12.0),
          child: Column(
          children: [
            CustomFormTextField(
              name: 'orgName',
              label: 'Наименование организации',
              validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле')),
            CustomFormTextField(
              name: 'phone',
              label: 'Номер телефона',
              validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле'),),
            CustomFormTextField(
              name: 'email',
              label: 'E-mail',
              validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле'),),
            CustomFormTextField(
              name: 'password',
              label: 'Пароль',
              validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле'),),
            CustomFormTextField(
              name: 'confirmPassword',
              label: 'Потвердить пароль',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле'),
                (val) {
                  if (_formKey.currentState?.fields["password"]?.value != val) {
                  return 'Введенные вами пароли не совпадают';
                }
                return null;
                }
              ]),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              height: 2.0,
              decoration: const BoxDecoration(color: Color(0xfff6f4f3)),
            ),
            const SizedBox(
              height: 35,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color(0xFF009ED1),
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: TextButton(
                              onPressed: () async{
                                final formState = _formKey.currentState!;
                                formState.save();
                                if (formState.validate()) {
                                  onConfirm(context, formState.value);
                                }
                              },
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 50,
                                child: const Text(
                                  'Зарегестрироваться',
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
                      height: 13
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color(0xFFE9EEF1),
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: TextButton(
                          onPressed: null,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 50,
                            child: const Text(
                              'Заполнить все поля',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: '.SF UI Display',
                                color: Color(0xFF617088),
                              ),
                            ),
                          ),
                        )
                    ),
                  ),
                  const SizedBox(
                      height: 8
                  ),
                  Text(
                      '(Необязательно при регистрации)',
                      style: TextStyle(
                          fontFamily: '.SF UI Display',
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400
                      )
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextButton(
                    onPressed: (){
                      AutoRouter.of(context).pop();
                    },
                    child: const Text(
                      'У вас уже есть аккаунт? Войти',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: '.SF UI Display',
                        color: Color(0xFF009ED1),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 54,
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

}