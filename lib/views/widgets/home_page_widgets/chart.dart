import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'custom_switch.dart';

class ChartWidget extends StatelessWidget{
  final List<_ChartData> data = [
    _ChartData('Jan', 50),
    _ChartData('Feb', 50),
    _ChartData('Mar', 50),
    _ChartData('Apr', 50),
    _ChartData('May', 50),
    _ChartData('Jun', 50),
    _ChartData('Jul', 50),
    _ChartData('Aug', 50),
    _ChartData('Sep', 50),
    _ChartData('Oct', 50),
    _ChartData('Nov', 50),
    _ChartData('Dec', 50),
  ];
  
  ChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
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
              margin: const EdgeInsets.only(top: 12.0, left: 12.0),
              alignment: Alignment.centerLeft,
              child: const Text('Статистика просмотров'),
            ),
            Container(
              alignment: Alignment.center,
              child: const CustomSwitch(),
            ),
            SizedBox(
              height: 400,
              child:SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(minimum: 0, maximum: 99, interval: 25),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_ChartData, String>>[
                  BarSeries<_ChartData, String>(
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                  )
                ],
                
              )
            )
          ],
      )
    );
  }

}

class _ChartData{
  final String x;
  final int y;
  _ChartData(this.x, this.y);
}