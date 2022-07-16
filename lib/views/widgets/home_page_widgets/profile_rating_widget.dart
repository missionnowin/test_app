import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logic/blocs/user_bloc/user_bloc.dart';
import 'package:test_app/logic/models/employer_model.dart';
import 'package:test_app/views/widgets/home_page_widgets/circular_rating_indicator.dart';

class ProfileRatingWidget extends StatelessWidget{
  const ProfileRatingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EmployerModel employerModel = context.read<UserBloc>().state.employerModel!;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(182, 182, 182, 0.3),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
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
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.bold,
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
                    width: 20
                ),
                CircularRatingIndicator(employerModel: employerModel),
              ]
          )
      )
  );
  }
}