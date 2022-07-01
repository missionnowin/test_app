// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:test_app/service/api/api_service.dart';
import 'package:test_app/service/api/api_singleton.dart';
import 'package:test_app/views/pages/login/registration_page.dart';
import '../../main_page.dart';

class AuthPage extends StatefulWidget{
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final ApiService _api = ApiSingleTon.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        backgroundColor: Colors.white,
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height/2.85,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)
                ),
                image: DecorationImage(
                  image : AssetImage('assets/intro.jpg'),
                  fit: BoxFit.fitWidth,
                )
              ),
           ),
            Container(
              margin: const EdgeInsets.all(12.0),
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                const Text(
                  ('Авторизация'),
                  style: TextStyle(
                    color: Color(0xFF009ED1),
                    fontSize: 16,
                  ),
                ),
                const Text(
                  ('Войти в аккаунт'),
                  style: TextStyle(
                    color : Color(0xff3f4554),
                    fontSize : 26,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Телефон / e-mail',
                  style: TextStyle(
                    color: Color(0xFF1D293F),
                    fontWeight: FontWeight.w400,
                    decorationStyle: TextDecorationStyle.dashed,
                  ),
                ),
                  const SizedBox(
                    height: 4,
                  ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: TextField(
                    controller: userNameController,
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
                  height: 7,
                ),
                const Text(
                  'Пароль',
                    style: TextStyle(
                        color: Color(0xFF1D293F))
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: TextField(
                    controller: passwordController,
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
              height: 7,
            ),
            Container(
              alignment: Alignment.center,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xFF009ED1),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: TextButton(
                  onPressed: () async  {
                    if(await _api.auth(userNameController.text, passwordController.text) == 200){
                      Navigator.popUntil(context, (route) => route.isFirst);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) => const MainPage()));
                    }
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 64,
                    child: const Text(
                      'Войти в аккаунт',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ),
            ),
            const SizedBox(
              height: 7,
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
                        Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const RegistrationPage()));
                      },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 64,
                      child: const Text(
                        'Нет аккаунта? Регистрация',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF617088),
                        ),
                      ),
                    ),
                  ),
            )
            ),
            const TextButton(
              onPressed: null,
                child: Text(
                  'Забыли пароль?',
                  style: TextStyle(
                    color: Color(0xFF617088),
                  ),
                ),
          ),
        ],
        ),
      );
  }

}