// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logic/blocs/custom_chart_bloc/custom_chart_bloc.dart';

class CustomSwitch extends StatefulWidget{
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>{
  final List<bool> isSelected = [true, false, false];
  final _headers = ['Неделя','Месяц','Год'];
  final _events = [SetWeek(), SetMonths(), SetYears()];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      renderBorder: false,
      fillColor: Colors.white,
      onPressed: (index) {
        setState(() {
          for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
            if (buttonIndex == index) {
              isSelected[buttonIndex] = true;
              context.read<CustomChartBloc>().add(_events[index]);
            } else {
              isSelected[buttonIndex] = false;
            }
          }
        });
      },
      isSelected: isSelected,
      children: List<Widget>.generate(3,
          (index) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected[index] ? const Color(0xffe6f6fc) : Colors.white,
                border: Border.all(color: isSelected[index] ? Colors.white : Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
            width: 91,
            height: 36,
            alignment: Alignment.center,
              child:
                Text(_headers[index],
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.blue)
                )
            )
          )
      )
    );
  }

}
