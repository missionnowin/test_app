import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logic/blocs/init_bloc/init_cubit.dart';

import '../../logic/blocs/user_bloc/user_bloc.dart';
import '../../service/router/app_router.dart';

class InitPage extends StatelessWidget{
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocConsumer(
          bloc: InitCubit()..init(),
          listener: (context, state) {
            if (state is IsNotAuthorized) {
              AutoRouter.of(context).replace(const LoginPages());
            }
            if (state is IsAuthorized) {
              context.read<UserBloc>().add(UpdateUser(employerModel: state.employerModel));
              AutoRouter.of(context).replace(const MainPageRoute());
            }
          },
          builder: (context, state) {
            return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
                child: CircularProgressIndicator()));
          },
        )
      ],
    );
  }
  
}