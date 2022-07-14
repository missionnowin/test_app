import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../custom_switch.dart';

class ChartWidget extends StatelessWidget{
  final data = const [
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
  
  const ChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 510,
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
            const SizedBox(height: 20,),
            SizedBox(
              height: 400,
              child:SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(minimum: 0, maximum: 99, interval: 25),
                tooltipBehavior: TooltipBehavior(enable: false),
                series: <ChartSeries<_ChartData, String>>[
                  BarSeries<_ChartData, String>(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xFF009ED1),
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
  const _ChartData(this.x, this.y);
}