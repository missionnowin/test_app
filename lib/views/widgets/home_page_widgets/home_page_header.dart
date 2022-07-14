import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget{
  const HomePageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text('Профиль работодателя',
          style: TextStyle(
            color: Color(0xFF009ED1),
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text('Личный рейтинг',
          style:
          TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

}