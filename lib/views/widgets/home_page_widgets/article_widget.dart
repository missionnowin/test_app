import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget{
  const ArticleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      child: Column(
        children: const [
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...',
            maxLines: 3,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),),
          SizedBox(height: 10.0,),
          Text(
            'Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua psum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua',
            maxLines: 6,
            style: TextStyle(
              fontSize: 12.0,
              color: Color(0xFF696974),
            ),),
        ],
      ),
    );
  }

}