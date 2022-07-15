import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget{
  final String logoPath;
  final int companyRate;
  const CustomAvatar({Key? key, required this.logoPath, required this.companyRate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Center(
            child: SizedBox(
              width: 113,
              height: 113,
              child: CircularProgressIndicator(
                strokeWidth: 6.24,
                color: const Color(0xFF14C686),
                value: companyRate * 0.01,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 11.5),
                SizedBox(
                    height: 90,
                    width: 90,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(logoPath),
                      radius: 45,
                    )
                ),
              ],
            ),
          ),
        ]
    );
  }


}