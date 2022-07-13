import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../../logic/blocs/user_bloc/user_bloc.dart';
import '../../../logic/models/sign_in_model.dart';
import '../../../service/router/app_router.dart';
import '../../forms/login/auth_form.dart';


class AuthPage extends StatelessWidget{
  const AuthPage({Key? key}) : super(key: key);

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
                        height: 25,
                      ),
                      BlocProvider<SignInBloc>(
                          create: (_) => SignInBloc(),
                          child: BlocListener<SignInBloc, SignInState>(
                              listener: (context, state){
                                if(state is SignInSuccess){
                                  context.read<UserBloc>().add(UpdateUser(state.employerModel));
                                  AutoRouter.of(context).replace(const MainPageRoute());
                                }
                                if(state is SignInError){
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wrong password and/or e-mail'),));
                                }
                              },
                              child: AuthForm(
                                onConfirm: (context , formValue ) {
                                  final signInModel = SignInModel.fromJson(formValue);
                                  context.read<SignInBloc>().add(SignInEvent(signInModel));
                                },
                              )
                          )
                      )
                    ]
                ),
              ),
            ]
        )
    );
  }
}