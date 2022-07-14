import 'package:flutter/material.dart';
import 'package:test_app/views/widgets/home_page_widgets/chart/chart_widget.dart';
import 'custom_switch.dart';

class Chart extends StatelessWidget{
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 575,
        margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 2.0),
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.grey,
              style: BorderStyle.solid,
              width: 0.4),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12.0, left: 12.0, bottom: 6.0),
              alignment: Alignment.centerLeft,
              child: const Text('Статистика просмотров'),
            ),
            Container(
              alignment: Alignment.center,
              child: const CustomSwitch(),
            ),
            const SizedBox(height: 12,),
            const ChartWidget(),
          ],
        )
    );
  }

}
