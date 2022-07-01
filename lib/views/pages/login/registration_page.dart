// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:test_app/service/api/api_singleton.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../components/models/sign_up.dart';
import 'auth_page.dart';


class RegistrationPage extends StatefulWidget{
  const RegistrationPage({Key? key}) : super(key: key);
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>{
  final _headers = ['Наименование организации', 'Номер телефона', 'E-mail', 'Пароль', 'Подтвердить пароль'];
  final List<TextEditingController> _controllers = List.generate(5, (i) => TextEditingController());
  final _api = ApiSingleTon.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: true,
        child: Scaffold(
          backgroundColor: const Color(0xFFFAFAFB),
          body: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children : <Widget>[
                  DecoratedBox(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)
                        ),
                        color: Colors.white
                      ),
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text('Регистрация | The Professional',
                            style: TextStyle(
                                color: Color(0xFF009ED1),
                                fontSize: 14.0
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const Text('Регистрация аккаунта',
                            style: TextStyle(
                              color: Color(0xFF3F4554),
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 23.0,
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: ToggleSwitch(
                                inactiveBgColor: Colors.lightBlue,
                                borderWidth: 1.2,
                                activeBgColor: const [Colors.white],
                                borderColor: const [Colors.lightBlue],
                                minWidth: MediaQuery.of(context).size.width/2 - 30,
                                minHeight: 50,
                                initialLabelIndex: 1,
                                totalSwitches: 2,
                                labels: const ['Работодатель','Соискатель'],
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(12.0),
                    height: 440,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _headers.length,
                        itemBuilder: (BuildContext context, int i) {
                          return SizedBox(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                textDirection: TextDirection.ltr,
                                children: <Widget>[
                                  Text(_headers[i],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      )
                                    ),
                                  const SizedBox(
                                    height: 1.0,
                                  ),
                                  TextField(
                                    controller: _controllers[i],
                                    decoration: InputDecoration(
                                      enabledBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7.0),
                                        borderSide: const BorderSide(color: Color(
                                            0xFFB6B6B6), width: 0.7),
                                      ),
                                      border: const OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7.0,
                                  ),
                                ]
                            ),
                          );
                        }
                    )
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF009ED1),
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                              child: TextButton(
                                onPressed: () async{
                                  SignUpData data = SignUpData(
                                      orgName: _controllers[0].text,
                                      email: _controllers[1].text,
                                      password: _controllers[2].text,
                                      phone: _controllers[3].text);
                                  if( await _api.signUp(data) == 'ok'){
                                    _api.auth(_controllers[1].text, _controllers[2].text);
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => const AuthPage()));
                                  }
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width - 50,
                                  child: const Text(
                                    'Зарегестрироваться',
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
                            height: 7
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: const Color(0xFFE9EEF1),
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                              child: TextButton(
                                onPressed: null,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width - 50,
                                  child: const Text(
                                    'Заполнить все поля',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF617088),
                                    ),
                                  ),
                                ),
                              )
                          ),
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
                      const SizedBox(
                        height: 25,
                      )
                      ],
                    ),
                  )
                ]
              )
            ]
          ),
        )
    );
  }
}