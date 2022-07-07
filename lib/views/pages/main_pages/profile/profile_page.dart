import 'package:flutter/material.dart';
import 'package:test_app/logic/components/models/employer_update_form_model.dart';
import 'package:test_app/service/api/api_service.dart';

import '../../../forms/profile/profile_page_form.dart';
import '../../login/auth_page.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  final _api = ApiService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
            backgroundColor: const Color(0xFFFAFAFB),
            body: ListView(
                children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white
                      ),
                      height: 106,
                      child: Row(
                        children: <Widget>[
                          FutureBuilder<EmployerUpdateModel>(
                            future: _api.getData(),
                            builder: (context, snapshot){
                              if(snapshot.hasData) {
                                EmployerUpdateModel? employer = snapshot.data;
                                return Container(
                                    margin: const EdgeInsets.all(12.0),
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(employer!.logoPath),
                                          radius: 32,
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Text('Работодатель',
                                              style: TextStyle(
                                                fontSize: 13.0,
                                                fontFamily: '.SF UI Display',
                                                color: Color(0xFF009ED1)
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(employer.name,
                                              style: const TextStyle(
                                                color: Color(0xFF3F4554),
                                                fontFamily: '.SF UI Display',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18.0
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: const Color(
                                                        0x333DD598),
                                                    borderRadius: BorderRadius.circular(25.0)
                                                ),
                                                child: SizedBox(
                                                  height: 24,
                                                  width: 51,
                                                  child: Row(
                                                  children: <Widget>[
                                                    const SizedBox(
                                                      width: 6,
                                                    ),
                                                    const Icon(Icons.star,
                                                        color: Color(
                                                        0xFF14C686),
                                                        size: 18,
                                                    ),
                                                    const SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(employer.companyRate.toString(),
                                                    style: const TextStyle(
                                                      color: Color(0xFF14C686)),
                                                    ),
                                                  ],
                                                )
                                              ),
                                            ),
                                          ],
                                        )
                                      ]
                                  )
                                );
                              }
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            ),
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 21,
                  ),
                  const ProfilePageForm(),
                  const SizedBox(
                    height: 50.0,
                  ),
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
                            _api.logout();
                            Navigator.popUntil(context, (route) => route.isFirst);
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (BuildContext context) => AuthPage()));
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
                  const SizedBox(
                    height: 20,
                  )
                ],
            ),
        ),
    );
  }
}
