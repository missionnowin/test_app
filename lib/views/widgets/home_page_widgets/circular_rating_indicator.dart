import 'package:flutter/material.dart';
import 'package:test_app/logic/models/employer_model.dart';

class CircularRatingIndicator extends StatelessWidget{
  final EmployerModel employerModel;
  const CircularRatingIndicator({Key? key, required this.employerModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                value: employerModel
                    .companyRate * 0.01,
              ),
            ),
          ),
          Center(child: Text(
            employerModel.companyRate.toString(),
            style: const TextStyle(
              color: Colors.greenAccent,
              fontSize: 39,
              fontWeight: FontWeight.bold,
            ),
          )
          ),
        ],
      ),
    );
  }

}