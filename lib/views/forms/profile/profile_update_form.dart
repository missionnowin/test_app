import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../logic/blocs/user_update_bloc/user_update_bloc.dart';
import '../../../logic/models/employer_model.dart';
import '../../../service/router/app_router.dart';
import '../../widgets/custom_text_field.dart';

class ProfileUpdateForm extends StatelessWidget{
  const ProfileUpdateForm({Key? key, required this.onConfirm, required this.employerModel}) : super(key: key);

  final void Function(BuildContext, Map<String, dynamic>) onConfirm;
  static final _formKey = GlobalKey<FormBuilderState>();
  final EmployerModel employerModel;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              CustomFormTextField(
                  name: 'name',
                  label: 'ФИО',
                  borderColor: const Color.fromRGBO(182, 182, 182, 0.3),
                  initialValue: employerModel.name,
                  validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле')),
              CustomFormTextField(
                  name: 'orgName',
                  label: 'Наименование организации',
                  initialValue: employerModel.orgName,
                  borderColor: const Color.fromRGBO(182, 182, 182, 0.3),
                  validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле')),
              CustomFormTextField(
                  name: 'email',
                  label: 'E-mail',
                  initialValue: employerModel.email,
                  borderColor: const Color.fromRGBO(182, 182, 182, 0.3),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле'),
                    FormBuilderValidators.email(context, errorText: 'Необходим действительный e-mail')
                  ])),
              CustomFormTextField(
                  name: 'legalAddress',
                  label: 'Юридический адрес',
                  initialValue: employerModel.legalAddress,
                  borderColor: const Color.fromRGBO(182, 182, 182, 0.3),
                  validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле')),
              CustomFormTextField(
                  name: 'actualAddress',
                  label: 'Фактический адрес',
                  initialValue: employerModel.actualAddress,
                  borderColor: const Color.fromRGBO(182, 182, 182, 0.3),
                  validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле')),
              CustomFormTextField(
                  name: 'companyDescription',
                  label: 'О компании',
                  borderColor: const Color.fromRGBO(182, 182, 182, 0.3),
                  initialValue: employerModel.companyDescription,
                  validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле')),
              CustomFormTextField(
                  name: 'post',
                  label: 'Наименование организации',
                  initialValue: employerModel.post,
                  borderColor: const Color.fromRGBO(182, 182, 182, 0.3),
                  validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле')),
              const SizedBox(height: 26),
              Container(
                alignment: Alignment.center,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: const Color(0xFF009ED1),
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: TextButton(
                          onPressed: () {
                            final formState = _formKey.currentState!;
                            formState.save();
                            if (formState.validate()) {
                              onConfirm(context, formState.value);
                            }
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 50,
                            child: const Text('Сохранить',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                    )
                ),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    alignment: Alignment.center,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: const Color(0xFFE9EEF1),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: TextButton(
                        onPressed: () {
                          //context.read<UserUpdateBloc>().add(CancelUpdateEvent());
                          //AutoRouter.of(context).pop();
                          AutoRouter.of(context).replace(const ProfilePageRoute());
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 50,
                          child: const Text('Отменить',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF617088),
                            ),
                          ),
                        ),
                      ),

                    )
                ),
            ]
          )
        )
      );
  }

}