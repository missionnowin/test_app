import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget{
  final String label;
  final int data;
  const ChartBar({Key? key, required this.label, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 700),
      tween: Tween<double>(begin: 0, end: (data > 100) ? 1 : data * 0.01),
      builder: (context, double value, widget) {
        return Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
              vertical: 11),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 40,
                child: Text(label,
                  style: const TextStyle(
                    fontFamily: 'DM Sans',
                    color: Color(0xFFADBDD7)
                  ),
                ),
              ),
              SizedBox(
                height: 12,
                width: MediaQuery.of(context).size.width * 2 / 3 - 20,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: LinearProgressIndicator(
                      value: value,
                      color: const Color(0xFF009ED1),
                      backgroundColor: const Color(0xFFE3F0FF),
                  ),
                )
              ),
            ],
          ),
        );
      },
    );
  }

}