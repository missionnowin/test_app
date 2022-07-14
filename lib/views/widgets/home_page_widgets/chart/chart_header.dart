import 'package:flutter/material.dart';

class ChartHeader extends StatelessWidget{
  const ChartHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Text('0',
          style: TextStyle(
            color: Color(0xFFB7C1D1)
          ),),
        Text('50',
          style: TextStyle(
              color: Color(0xFFB7C1D1)
          ),),
        Text('75',
          style: TextStyle(
              color: Color(0xFFB7C1D1)
          ),),
        Text('99+',
          style: TextStyle(
              color: Color(0xFFB7C1D1)
          ),),
      ],
    );
  }
  
}