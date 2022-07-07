// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:test_app/logic/components/models/employer_update_form_model.dart';
import 'package:test_app/service/api/api_service.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<EmployerUpdateModel>(
            future: _api.getData(),
            builder: (context, snapshot){
              if(snapshot.hasData) {
                EmployerUpdateModel employer = snapshot.data!;
                return Scaffold(
                    backgroundColor: Colors.white,
                    body: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(12.0),
                        padding: const EdgeInsets.all(12.0),
                        child: ListView(
                            children:<Widget>[
                              const Text('Профиль работодателя',
                                style: TextStyle(
                                  color: Color(0xFF009ED1),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text('Личный рейтинг',
                                style:
                                TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),

                              DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey,
                                      style: BorderStyle.solid,
                                      width: 0.4
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white,
                                ),
                                child: Container(
                                    height: 118,
                                    padding: const EdgeInsets.all(12.0),
                                    margin: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                            width: 167,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: const <Widget>[
                                                Text('Рейтинг'),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text('Положительный',
                                                  style: TextStyle(
                                                      color: Colors.greenAccent,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text('Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor ur. ',
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 11,
                                                  ),
                                                )
                                              ]
                                            )
                                        ),
                                        const SizedBox(
                                          width: 30
                                        ),
                                        SizedBox(
                                          width: 103,
                                          height: 103.0,
                                          child: Stack(
                                            children: <Widget>[
                                              Center(
                                                child: SizedBox(
                                                  width: 103,
                                                  height: 103.0,
                                                  child: CircularProgressIndicator(
                                                    strokeWidth: 5,
                                                    value: employer.companyRate * 0.01,
                                                  ),
                                                ),
                                              ),
                                              Center(child: Text(employer.companyRate.toString(),
                                                style: const TextStyle(
                                                  color: Colors.greenAccent,
                                                  fontSize: 39,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]
                                    )
                                )
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 1300,
                                alignment: Alignment.topCenter,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)
                                    ),
                                    image: DecorationImage(
                                      image : AssetImage('assets/stats.png'),
                                      fit: BoxFit.fill,
                                    )
                                ),
                              ),
                            ]
                        )
                    )
                );
              }
              return const Center(
                  child: CircularProgressIndicator()
              );
            }
        ),
    );
  }
}