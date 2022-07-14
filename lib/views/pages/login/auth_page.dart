import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/views/widgets/auth_pages_widgets/auth_page_header.dart';
import 'package:test_app/views/widgets/auth_pages_widgets/auth_page_logo.dart';
import '../../../logic/blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../../logic/blocs/user_bloc/user_bloc.dart';
import '../../../logic/models/sign_in_model.dart';
import '../../../service/router/app_router.dart';
import '../../forms/login/auth_form.dart';


class AuthPage extends StatelessWidget{
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      onVerticalDragEnd: (DragEndDetails details) => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: <Widget>[
                const AuthPageLogo(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12.0),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 32.0,
                        ),
                        const AuthPaheHeader(),
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
      ),
    );
  }
}