import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget{
  final String label;
  final int data;
  const ChartBar({Key? key, required this.label, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 11),
      child: Row(
        children: <Widget>[
          Text(label,
            style: const TextStyle(
              fontFamily: 'DM Sans',
              color: Color(0xFFADBDD7)
            ),),
          const SizedBox(width: 14.0,),
          SizedBox(
            height: 12,
            width: MediaQuery.of(context).size.width * 2 / 3 - 20,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: LinearProgressIndicator(
                  value: data/100,
                  color: const Color(0xFF009ED1),
                  backgroundColor: const Color(0xFFE3F0FF),
              ),
            )
          ),
        ],
      ),
    );
  }

}