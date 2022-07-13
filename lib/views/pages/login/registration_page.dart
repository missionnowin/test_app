// ignore_for_file: library_private_types_in_public_api
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logic/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:test_app/logic/blocs/user_bloc/user_bloc.dart';
import 'package:test_app/logic/models/sign_up_model.dart';
import 'package:test_app/service/router/app_router.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../forms/login/registration_form.dart';

class RegistrationPage extends StatelessWidget{
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      onVerticalDragEnd: (DragEndDetails details) => FocusScope.of(context).unfocus(),
      child: SafeArea(
          top: false,
          bottom: true,
          child: Scaffold(
              backgroundColor: const Color(0xFFFAFAFB),
              body: BlocProvider<SignUpBloc>(
                  create: (_) => SignUpBloc(),
                  child: BlocListener<SignUpBloc, SignUpState>(
                    listener: (context, state){
                      if(state is SignUpSuccess){
                        context.read<UserBloc>().add(UpdateUser(state.employerModel));
                        AutoRouter.of(context).replace(const MainPageRoute());
                      }
                      if(state is SignUpEmailError){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('E-mail is already in use'),));
                      }
                      if(state is SignUpPhoneError){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Phone is already in use'),));
                      }
                      if(state is SignUpError){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Something went wrong'),));
                      }
                    },
                    child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children : <Widget>[
                              const SizedBox(height: 45),
                              DecoratedBox(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0)
                                    ),
                                    color: Colors.white
                                ),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 12.0),
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 9.0,
                                      ),
                                      const Text('Регистрация | The Professional',
                                        style: TextStyle(
                                            color: Color(0xFF009ED1),
                                            fontSize: 14.0
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      const Text('Регистрация аккаунта',
                                        style: TextStyle(
                                          color: Color(0xFF3F4554),
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 23.0,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          child: ToggleSwitch(
                                            inactiveBgColor: Colors.white,
                                            borderWidth: 1.2,
                                            activeBgColor: const [Colors.lightBlue],
                                            borderColor: const [Colors.lightBlue],
                                            minWidth: MediaQuery.of(context).size.width/2 - 30,
                                            minHeight: 50,
                                            initialLabelIndex: 0,
                                            totalSwitches: 2,
                                            activeFgColor: Colors.white,
                                            labels: const ['Работодатель','Соискатель'],
                                          )
                                      ),
                                      const SizedBox(
                                        height: 27.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              RegistrationForm(
                                onConfirm: (context , formValue ) {
                                  final signUpModel = SignUpModel.fromJson(formValue);
                                  context.read<SignUpBloc>().add(SignUpEvent(signUpModel));
                                },
                              )
                            ]
                        )
                    ),
                  )
              )
          )
      ),
    );
  }
}