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
        SizedBox(height: 7,),
        ChartBar(label: 'Jan', data: 15,),
        ChartBar(label: 'Feb', data: 55,),
        ChartBar(label: 'Mar', data: 75,),
        ChartBar(label: 'Apr', data: 25,),
        ChartBar(label: 'May', data: 45,),
        ChartBar(label: 'Jun', data: 65,),
        ChartBar(label: 'Jul', data: 35,),
        ChartBar(label: 'Aug', data: 15,),
        ChartBar(label: 'Sep', data: 5,),
        ChartBar(label: 'Oct', data: 125,),
        ChartBar(label: 'Nov', data: 235,),
      ],
    );
  }

}