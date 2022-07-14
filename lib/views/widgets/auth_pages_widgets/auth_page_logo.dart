import 'package:flutter/material.dart';

class AuthPageLogo extends StatelessWidget{
  const AuthPageLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

}