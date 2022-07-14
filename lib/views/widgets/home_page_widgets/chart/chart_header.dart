import 'package:flutter/material.dart';

class ChartHeader extends StatelessWidget{
  const ChartHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: const <Widget>[
          Spacer(),
          Text('0',
            style: TextStyle(
              fontFamily: 'DM Sans',
              color: Color(0xFFB7C1D1)
            ),),
          Spacer(),
          Text('50',
            style: TextStyle(
                fontFamily: 'DM Sans',
                color: Color(0xFFB7C1D1)
            ),),
          Spacer(),
          Text('75',
            style: TextStyle(
                fontFamily: 'DM Sans',
                color: Color(0xFFB7C1D1)
            ),),
          Spacer(),
          Text('99+',
            style: TextStyle(
                fontFamily: 'DM Sans',
                color: Color(0xFFB7C1D1)
            ),),
        ],
      ),
    );
  }
  
}
class Spacer extends StatelessWidget{
  const Spacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 53,
    );
  }
}