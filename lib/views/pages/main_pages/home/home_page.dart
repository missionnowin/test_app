import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logic/models/employer_model.dart';
import 'package:test_app/views/widgets/home_page_widgets/content.dart';
import '../../../../logic/blocs/user_bloc/user_bloc.dart';
import '../../../widgets/home_page_widgets/chart.dart';


class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            EmployerModel employer = state.employerModel!;
            return Scaffold(
                backgroundColor: Colors.white,
                body: Container(
                    width: MediaQuery.of(context).size
                        .width,
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(10.0),
                    child: ListView(
                        children: <Widget>[
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
                                        SizedBox(
                                            width: 170,
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: const <Widget>[
                                                  Text('Рейтинг'),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text('Положительный',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .greenAccent,
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        fontSize: 20
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor ur. ',
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
                                                    value: employer
                                                        .companyRate * 0.01,
                                                  ),
                                                ),
                                              ),
                                              Center(child: Text(
                                                employer.companyRate.toString(),
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
                          ChartWidget(),
                          Container(
                            margin: const EdgeInsets.all(12.0),
                            child: Column(
                              children: const [
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua...',
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                SizedBox(height: 10.0,),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua psum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua',
                                  maxLines: 6,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xFF696974),
                                  ),),
                              ],
                            ),
                          ),

                          Container(
                            alignment: Alignment.center,
                            child: const ContentWidget(),
                          ),
                        ]
                    )
                )
            );
          }
      ),
    );
  }
}