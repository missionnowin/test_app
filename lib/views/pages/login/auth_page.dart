// ignore_for_file: library_private_types_in_public_api
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logic/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:test_app/logic/components/models/sign_in_model.dart';
import 'package:test_app/views/pages/login/registration_page.dart';

import '../../../logic/blocs/user_bloc/user_bloc.dart';
import '../../../service/router/app_router.dart';
import '../main_pages/main_page.dart';

class AuthPage extends StatelessWidget{
   AuthPage({Key? key}) : super(key: key);

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.height * 0.355,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)
                    ),
                    image: DecorationImage(
                      image : AssetImage('assets/intro.jpg'),
                      fit: BoxFit.fitHeight,
                    )
                  ),
               ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12.0),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    const SizedBox(
                      height: 32.0,
                    ),
                    const Text(
                      ('Авторизация'),
                      style: TextStyle(
                        fontFamily: '.SF UI Display',
                        color: Color(0xFF009ED1),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height:6.0,
                    ),
                    const Text(
                      ('Войти в аккаунт'),
                      style: TextStyle(
                        color : Color(0xff3f4554),
                        fontFamily: '.SF UI Display',
                        fontSize : 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Телефон / e-mail',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: const Color(0xFF1D293F).withOpacity(0.5),
                        fontFamily: '.SF UI Display',
                        fontWeight: FontWeight.w400,
                        decorationStyle: TextDecorationStyle.dashed,
                      ),
                    ),
                      const SizedBox(
                        height: 6,
                      ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      child: TextField(
                        controller: _userNameController,
                        decoration: InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.lightBlue, width: 0.9),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Пароль',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: '.SF UI Display',
                            fontWeight: FontWeight.w400,
                          color: const Color(0xFF1D293F).withOpacity(0.5),
                        )
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      child: TextField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Color(0xFF009ED1), width: 0.5),
                            ),
                            border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                   ]
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                BlocProvider<SignInBloc>(
                  create: (_) => SignInBloc(),
                  child: BlocListener<SignInBloc, SignInState>(
                    listener: (context, state){
                      if(state is SignInSuccess){
                        context.read<UserBloc>().add(UpdateUser(employerModel: state.employerModel));
                        AutoRouter.of(context).replace(const MainPageRoute());
                      }
                      if(state is SignInError){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wrong password and/or e-mail'),));
                      }
                    },
                      child: Container(
                        alignment: Alignment.center,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color(0xFF009ED1),
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: BlocBuilder<SignInBloc, SignInState>(
                              builder: (context, state) {
                                return TextButton(
                                  onPressed: (){
                                    context.read<SignInBloc>().add(SignInEvent(SignInModel(email: _userNameController.text, password: _passwordController.text)));
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
                                );
                              },
                            )
                        ),
                      ),
                  ),
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
            ),
          );
  }
}