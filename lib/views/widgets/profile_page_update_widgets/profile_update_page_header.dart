import 'package:flutter/material.dart';

class ProfileUpdatePageHeader extends StatelessWidget{
  const ProfileUpdatePageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        color: Colors.white,
        child: Container(
          height: 80,
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              SizedBox(
                height: 13,
              ),
              Text('Профиль работодателя',
                style: TextStyle(
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
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
    );
  }

}