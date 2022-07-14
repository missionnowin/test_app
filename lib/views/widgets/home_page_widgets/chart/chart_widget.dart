import 'package:flutter/material.dart';
import 'package:test_app/views/widgets/home_page_widgets/chart/chart_header.dart';

import 'chart_bar.dart';

class ChartWidget extends StatelessWidget{
  const ChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        ChartHeader(),
        ChartBar(label: 'Dec', data: 15,),
        ChartBar(label: 'Nov', data: 55,),
        ChartBar(label: 'Oct', data: 75,),
        ChartBar(label: 'Sep', data: 25,),
      ],
    );
  }

}