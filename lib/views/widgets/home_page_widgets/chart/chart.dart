import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logic/blocs/custom_chart_bloc/custom_chart_bloc.dart';
import 'package:test_app/views/widgets/home_page_widgets/chart/chart_widget.dart';
import 'custom_switch.dart';

class Chart extends StatelessWidget{
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomChartBloc>(
      create: (context) => CustomChartBloc(),
      child: BlocBuilder<CustomChartBloc, CustomChartState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 2.0),
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: const Color.fromRGBO(182, 182, 182, 0.3),
                  style: BorderStyle.solid,
                  width: 0.4),
            ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 21.0, left: 21.0, bottom: 6.0),
                    alignment: Alignment.centerLeft,
                    child: const Text('Статистика просмотров',
                    style: TextStyle(
                      fontFamily: 'Roboto'
                    ),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const CustomSwitch(),
                  ),
                  const SizedBox(height: 12,),
                  ChartWidget(data: state.data!),
                ],
              ),
            );
        },
      ),
    );
  }

}
