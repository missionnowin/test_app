import 'package:flutter/material.dart';

class AuthPaheHeader extends StatelessWidget{
  const AuthPaheHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text(
          ('Авторизация'),
          style: TextStyle(
            color: Color(0xFF009ED1),
            fontSize: 14,
          ),
        ),
        SizedBox(
          height:6.0,
        ),
        Text(
          ('Войти в аккаунт'),
          style: TextStyle(
              color : Color(0xff3f4554),
              fontSize : 24,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }

}