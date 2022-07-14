import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test_app/views/widgets/home_page_widgets/chart/chart_bar.dart';
import 'package:test_app/views/widgets/home_page_widgets/chart/chart_header.dart';
import '../../../../logic/models/chart_data.dart';

class ChartWidget extends StatelessWidget{
  final List<ChartData> data;
  const ChartWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ChartHeader(),
        const SizedBox(height: 7,),
       ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ChartBar(label: data[index].label, data: data[index].value);
        },
      ),
        const SizedBox(height: 25),
      ],
    );
  }

}