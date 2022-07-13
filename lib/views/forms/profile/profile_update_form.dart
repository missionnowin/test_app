import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../logic/models/employer_model.dart';
import '../../widgets/custom_text_field.dart';

class ProfileUpdateForm extends StatelessWidget{
  ProfileUpdateForm({Key? key, required this.onConfirm, required this.employerModel}) : super(key: key);

  final void Function(BuildContext, Map<String, dynamic>) onConfirm;
  static final _formKey = GlobalKey<FormBuilderState>();
  EmployerModel employerModel;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Container(
          margin: const EdgeInsets.all(12.0),
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              CustomFormTextField(
                  name: 'name',
                  label: 'ФИО',
                  initialValue: employerModel.name,
                  validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле')),
              CustomFormTextField(
                  name: 'orgName',
                  label: 'Наименование организации',
                  initialValue: employerModel.orgName,
                  validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле')),
              CustomFormTextField(
                  name: 'email',
                  label: 'E-mail',
                  initialValue: employerModel.email,
                  validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле')),
              CustomFormTextField(
                  name: 'legalAddress',
                  label: 'Юридический адрес',
                  initialValue: employerModel.legalAddress,
                  validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле')),
              CustomFormTextField(
                  name: 'actualAddress',
                  label: 'Фактический адрес',
                  initialValue: employerModel.actualAddress,
                  validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле')),
              CustomFormTextField(
                  name: 'companyDescription',
                  label: 'О компании',
                  initialValue: employerModel.companyDescription,
                  validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле')),
              CustomFormTextField(
                  name: 'post',
                  label: 'Наименование организации',
                  initialValue: employerModel.post,
                  validator: FormBuilderValidators.required(context, errorText: 'Необходимо заполнить поле')),

            ]
          )
        )
      );
  }

}