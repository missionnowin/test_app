// ignore_for_file: library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logic/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:test_app/logic/blocs/user_bloc/user_bloc.dart';
import 'package:test_app/logic/components/models/sign_up_model.dart';
import 'package:test_app/service/router/app_router.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RegistrationPage extends StatelessWidget{
  final _headers = ['Наименование организации', 'Номер телефона', 'E-mail', 'Пароль', 'Подтвердить пароль'];
  final List<TextEditingController> _controllers = List.generate(5, (i) => TextEditingController());

  RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: true,
        child: Scaffold(
          backgroundColor: const Color(0xFFFAFAFB),
          body: BlocProvider<SignUpBloc>(
              create: (_) => SignUpBloc(),
              child: BlocListener<SignUpBloc, SignUpState>(
                listener: (context, state){
                  if(state is SignUpSuccess){
                    context.read<UserBloc>().add(UpdateUser(state.employerModel));
                    AutoRouter.of(context).replace(const MainPageRoute());
                  }
                  if(state is SignUpError){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Something went wrong'),));
                  }
                },
                child: ListView(
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
                            margin: const EdgeInsets.symmetric(horizontal: 12.0),
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 9.0,
                                ),
                                const Text('Регистрация | The Professional',
                                  style: TextStyle(
                                      color: Color(0xFF009ED1),
                                      fontFamily: '.SF UI Display',
                                      fontSize: 14.0
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                const Text('Регистрация аккаунта',
                                  style: TextStyle(
                                    color: Color(0xFF3F4554),
                                    fontFamily: '.SF UI Display',
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 23.0,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    child: ToggleSwitch(
                                      inactiveBgColor: Colors.white,
                                      borderWidth: 1.2,
                                      activeBgColor: const [Colors.lightBlue],
                                      borderColor: const [Colors.lightBlue],
                                      minWidth: MediaQuery.of(context).size.width/2 - 30,
                                      minHeight: 50,
                                      initialLabelIndex: 0,
                                      totalSwitches: 2,
                                      activeFgColor: Colors.white,
                                      labels: const ['Работодатель','Соискатель'],
                                      /*customTextStyles: const [
                                        TextStyle(
                                          fontFamily: '.SF UI Display',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        TextStyle(
                                          fontFamily: '.SF UI Display',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),

                                      ],*/
                                    )
                                ),
                                const SizedBox(
                                  height: 27.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 22.0,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12.0),
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                                          style: TextStyle(
                                            fontFamily: '.SF UI Display',
                                            color: Colors.black.withOpacity(0.5),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400
                                            )
                                          ),
                                        const SizedBox(
                                          height: 6.0,
                                        ),
                                        TextField(
                                          controller: _controllers[i],
                                          decoration: InputDecoration(
                                            enabledBorder:  OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                              borderSide: const BorderSide(color: Color(
                                                  0xFFB6B6B6), width: 0.7),
                                            ),
                                            border: const OutlineInputBorder(),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                      ]
                                  ),
                                );
                              }
                          )
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Container(
                          height: 2.0,
                          decoration: const BoxDecoration(color: Color(0xfff6f4f3)),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Center(
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF009ED1),
                                        borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    child: BlocBuilder<SignUpBloc, SignUpState>(
                                      builder: (context, state) {
                                        return TextButton(
                                          onPressed: () async{
                                            SignUpModel data = SignUpModel(
                                                orgName: _controllers[0].text,
                                                email: _controllers[2].text,
                                                password: _controllers[3].text,
                                                phone: _controllers[1].text);
                                            context
                                                .read<SignUpBloc>()
                                                .add(SignUpEvent(data));
                                          },
                                          child: SizedBox(
                                            width: MediaQuery.of(context).size.width - 50,
                                            child: const Text(
                                              'Зарегестрироваться',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: '.SF UI Display',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )

                                ),
                              ),
                              const SizedBox(
                                  height: 13
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFE9EEF1),
                                        borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    child: TextButton(
                                      onPressed: null,
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width - 50,
                                        child: const Text(
                                          'Заполнить все поля',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: '.SF UI Display',
                                            color: Color(0xFF617088),
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                              ),
                              const SizedBox(
                                  height: 8
                              ),
                            Text(
                              '(Необязательно при регистрации)',
                                style: TextStyle(
                                    fontFamily: '.SF UI Display',
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400
                                )
                            ),
                              const SizedBox(
                                height: 25,
                              ),
                            TextButton(
                              onPressed: (){
                                AutoRouter.of(context).navigateBack();
                              },
                              child: const Text(
                                'У вас уже есть аккаунт? Войти',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: '.SF UI Display',
                                  color: Color(0xFF009ED1),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 54,
                            ),
                            ],
                          ),
                        )
                      ]
                    )
                  ]
                ),
              )
          )
        )
    );
  }
}