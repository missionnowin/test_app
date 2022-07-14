import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget{
  final String label;
  final int data;
  const ChartBar({Key? key, required this.label, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      child: Row(
        children: <Widget>[
          Text(label,),
          const SizedBox(width: 5.0,),
          LinearProgressIndicator(
            value: data/100,
            color: const Color(0xFF009ED1),
            backgroundColor: const Color(0xFFE3F0FF),
          ),
        ],
      ),
    );
  }

}