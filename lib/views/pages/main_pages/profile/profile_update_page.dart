// ignore_for_file: library_private_types_in_public_api
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logic/blocs/profile_update_bloc/profile_update_bloc.dart';
import 'package:test_app/logic/blocs/user_bloc/user_bloc.dart';
import 'package:test_app/logic/blocs/user_update_bloc/user_update_bloc.dart';
import 'package:test_app/logic/models/employer_model.dart';
import 'package:test_app/service/router/app_router.dart';
import 'package:test_app/views/widgets/profile_page_update_widgets/profile_update_image.dart';
import '../../../forms/profile/profile_update_form.dart';
import '../../../widgets/profile_page_update_widgets/profile_update_page_header.dart';

class ProfilePageUpdate extends StatelessWidget {
  const ProfilePageUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      onVerticalDragEnd: (DragEndDetails details) => FocusScope.of(context).unfocus(),
      child: SafeArea(
          top: false,
          bottom: true,
          child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                EmployerModel employer = EmployerModel.copyWith(state.employerModel!);
                return BlocProvider<UserUpdateBloc>(
                  create: (_) => UserUpdateBloc(employer),
                  child: BlocListener<UserUpdateBloc, UserUpdateState>(
                      listener: (context, state) {
                        if (state is UserUpToDateState) {
                          context.read<UserBloc>().add(
                              UpdateUser(state.employerModel!));
                        }
                        if (state is UserCancelState) {
                          state.employerModel = EmployerModel.copyWith(context.read<UserBloc>().state.employerModel!);
                        }
                      },
                      child: BlocBuilder<UserUpdateBloc, UserUpdateState>(
                        builder: (context, state) {
                            return WillPopScope(
                              onWillPop: () async
                              {
                                if(await _onBackPressed(context)){
                                  context.read<UserUpdateBloc>().add(CancelUpdateEvent());
                                  return true;
                                }
                                return false;
                              },
                              child: Scaffold(
                                  backgroundColor: const Color(0xFFFAFAFB),
                                  body: SingleChildScrollView(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 50,
                                            ),
                                            const ProfileUpdatePageHeader(),
                                            Container(
                                              height: 25,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                              margin: const EdgeInsets.symmetric(horizontal: 12.0),
                                              child: const ProfileUpdateImage(),
                                            ),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            BlocProvider<ProfileUpdateBloc>(
                                              create: (_) => ProfileUpdateBloc(),
                                              child: BlocListener<ProfileUpdateBloc, ProfileUpdateState>(
                                                listener: (context, state){
                                                  if (state is ProFileUpdateSuccess) {
                                                    context.read<UserUpdateBloc>().add(UpdateUserEvent(employer));
                                                    AutoRouter.of(context).replace(const ProfilePageRoute());
                                                  }
                                                  if (state is ProfileUpdateError) {
                                                    ScaffoldMessenger.of(
                                                        context).showSnackBar(
                                                        const SnackBar(
                                                            content: Text(
                                                                'Something went wrong')));
                                                  }
                                                },
                                                child: ProfileUpdateForm(
                                                    employerModel: employer,
                                                    onConfirm: (context, formValue) {
                                                      employer.update(formValue);
                                                      context.read<ProfileUpdateBloc>().add(ProfileSaveUpdatesEvent(employer));
                                                    }
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                                height: 45
                                            ),
                                          ]
                                      )
                                  )
                              ),
                            );
                          }
                        ),
                    )
                );
              }
          )
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) async{
      bool result = false;
      await showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: const Text('Подтверждение'),
            content: const Text('Изменения будут удалены, Вы уверены что хотите выйти?'),
            actions: <Widget>[
              TextButton(
                  onPressed: (){
                    result = true;
                    AutoRouter.of(context).pop();
                  },
                  child: const Text('Выйти')),
              TextButton(
                  onPressed: (){
                    AutoRouter.of(context).pop();
                  },
                  child: const Text('Продолжить редактирование'))
            ],
          );
        }
      );
      return Future.value(result);

  }
}