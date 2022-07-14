import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/blocs/user_bloc/user_bloc.dart';
import '../../../service/router/app_router.dart';

class ProfilePageFooter extends StatelessWidget{
  const ProfilePageFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF009ED1)),
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xFFEEF5F9),
              ),
              child: TextButton(
                onPressed: () {
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: const Text(
                    'Зарегистрироваться',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF009ED1),
                    ),
                  ),
                ),
              )
          ),
        ),
        const SizedBox(
          height: 13,
        ),
        Container(
            alignment: Alignment.center,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: const Color(0xFFF8EEF2),
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: TextButton(
                onPressed: (){
                  context.read<UserBloc>().add(UserLogout());
                  AutoRouter.of(context).popUntil((route) => route.isFirst);
                  AutoRouter.of(context).replace(const LoginPages());
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: const Text(
                    'Выйти',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFD1003F),
                    ),
                  ),
                ),
              ),
            )
        ),
        const SizedBox(
          height: 5,
        ),
        const TextButton(
          onPressed: null,
          child: Text(
            'Нужна помощь',
            style: TextStyle(
              color: Color(0xFF009ED1),
            ),
          ),
        ),
      ],
    );
  }

}