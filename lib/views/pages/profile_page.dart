// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:test_app/views/pages/profile_update_page.dart';
import '../../components/models/employer.dart';
import '../../service/api/api_singleton.dart';
import '../../service/icons.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  final _api = ApiSingleTon.instance;
  final _headers = ['Dashboard', 'Настройки профиля', 'Мои документы', 'Рейтинги', 'Тестирование','Поиск вакансий', 'Мои отклики', 'Рекомендации', 'Тарифы', 'FAQ'];
  final List<IconData> _icons = [TabIcons.vector, TabIcons.profile_settings, TabIcons.documents, TabIcons.rating, TabIcons.tests, TabIcons.vacancies, TabIcons.replies, TabIcons.recs,TabIcons.fee, TabIcons.faq];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(
                children: <Widget>[
                    SizedBox(
                      height: 106,
                      child: Row(
                        children: <Widget>[
                          FutureBuilder<Employer>(
                            future: _api.getData(),
                            builder: (context, snapshot){
                              if(snapshot.hasData) {
                                Employer? employer = snapshot.data;
                                return Container(
                                    margin: const EdgeInsets.all(12.0),
                                    padding: const EdgeInsets.all(8.0),
                                    child:Row(
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
                                                color: Color(0xFF009ED1)
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(employer.name,
                                              style: const TextStyle(
                                                color: Color(0xFF3F4554),
                                                fontWeight: FontWeight.bold,
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
                                                    borderRadius: BorderRadius.circular(5.0)
                                                ),
                                                child: Container(
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
                  Container(
                    margin: const EdgeInsets.all(12.0),
                    padding: const EdgeInsets.all(8.0),
                    height: 472,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _headers.length,
                      itemBuilder: (BuildContext context, int index){
                        return InkWell(
                          onTap: (){
                            if(_headers[index] == 'Настройки профиля'){
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const ProfilePageUpdate()));
                            }
                          },
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(children: <Widget>[
                                Icon(_icons[index]),
                                const SizedBox(width: 30.0,),
                                Text(_headers[index],
                                style: const TextStyle(
                                  color: Color(0xFF44444F),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                )
                                ),
                              ],
                              ),
                              const SizedBox(
                                height: 13.0,
                              )
                            ],
                          ),
                        );
                      }
                      )
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF009ED1)),
                            borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
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
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: TextButton(
                          onPressed: (){
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 50,
                            child: const Text(
                              'Удалить необязательные поля',
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
                    height: 7,
                  ),
                  const TextButton(
                    onPressed: null,
                    child: Text(
                      'Нужна помощь',
                      style: TextStyle(
                        color: Color(0xFF617088),
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