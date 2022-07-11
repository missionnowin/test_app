import 'package:flutter/material.dart';

class ContentWidget extends StatelessWidget{
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      height: 410,
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: const DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 20,
            margin: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                const SizedBox(width: 10),
                const Text('1/6',
                style: TextStyle(
                  color: Colors.white,
                ),),
                const SizedBox(width: 10,),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 160,
                    child:
                    const LinearProgressIndicator(
                      value: 1/6,
                    ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 170,
          ),

          Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              alignment: Alignment.center,
              child: const Text('Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua...',
              maxLines: 3,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width - 120,
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.all(35.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: const Color(0xFF14C686),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: TextButton(
                  onPressed: (){
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 64,
                    child: const Text(
                      'Пройти тестирование',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: '.SF UI Display',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
          ),
        ]
      ),
    );
  }
  
}