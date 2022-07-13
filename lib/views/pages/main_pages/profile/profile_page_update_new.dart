// ignore_for_file: library_private_types_in_public_api
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logic/blocs/profile_update_bloc/profile_update_bloc.dart';
import 'package:test_app/logic/blocs/user_bloc/user_bloc.dart';
import 'package:test_app/logic/blocs/user_update_bloc/user_update_bloc.dart';
import 'package:test_app/logic/models/employer_model.dart';
import 'package:test_app/views/forms/profile/profile_update_image.dart';
import '../../../forms/profile/profile_update_form.dart';

class ProfilePageUpdate extends StatelessWidget {
  ProfilePageUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: true,
        child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              EmployerModel employer = EmployerModel.copyWith(
                  state.employerModel!);
              return BlocProvider<UserUpdateBloc>(
                create: (_) => UserUpdateBloc(employer),
                child: BlocListener<UserUpdateBloc, UserUpdateState>(
                    listener: (context, state) {
                      if (state is UserUpToDateState) {
                        context.read<UserBloc>().add(
                            UpdateUser(state.employerModel!));
                      }
                      if (state is UserCancelState) {
                        state.employerModel = EmployerModel.copyWith(context
                            .read<UserBloc>()
                            .state
                            .employerModel!);
                      }
                    },
                    child: WillPopScope(
                      onWillPop: () async
                      {
                        context.read<UserUpdateBloc>().add(CancelUpdateEvent());
                        return Future.value(true);
                      },
                      child: Scaffold(
                          backgroundColor: const Color(0xFFFAFAFB),
                          body: SingleChildScrollView(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        color: Colors.white,
                                        child: Container(
                                          height: 80,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 12.0),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12.0),
                                          child: Column(
                                            children: const <Widget>[
                                              SizedBox(
                                                height: 13,
                                              ),
                                              Text('Профиль работодателя',
                                                style: TextStyle(
                                                  fontFamily: '.SF UI Display',
                                                  color: Color(0xFF009ED1),
                                                  fontSize: 15,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Text('Настройки профиля',
                                                style:
                                                TextStyle(
                                                  fontFamily: '.SF UI Display',
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                    Container(
                                      height: 25,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                        margin: const EdgeInsets.symmetric(horizontal: 12.0),
                                            child: const ProfileUpdateImageForm(),
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
                                            AutoRouter.of(context).navigateBack();
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
                                              final signUpModel = EmployerModel.fromJson(formValue);
                                              context.read<ProfileUpdateBloc>().add(ProfileSaveUpdatesEvent(signUpModel));
                                            }
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFE9EEF1),
                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          child: TextButton(
                                                  onPressed: () {
                                                    context.read<UserUpdateBloc>().add(CancelUpdateEvent());
                                                    AutoRouter.of(context).pop();
                                                  },
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context).size.width - 50,
                                                    child: const Text('Отменить',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily: '.SF UI Display',
                                                        color: Color(0xFF617088),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                          )
                                      ),
                                    const SizedBox(
                                        height: 45
                                    ),
                                  ]
                              )
                          )
                      ),
                    )

                ),
              );
            }
        )
    );
  }
}