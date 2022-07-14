import 'package:flutter/material.dart';

class SignUpPageHeader extends StatelessWidget{
  const SignUpPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text('Регистрация | The Professional',
          style: TextStyle(
              color: Color(0xFF009ED1),
              fontSize: 14.0
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text('Регистрация аккаунта',
          style: TextStyle(
            color: Color(0xFF3F4554),
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

}