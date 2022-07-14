import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/chart_data.dart';

part 'custom_chart_event.dart';
part 'custom_chart_state.dart';

class CustomChartBloc extends Bloc<CustomChartEvent, CustomChartState> {
  CustomChartBloc() : super(CustomChartInitial()) {
    on<SetWeek>(_setWeek);
    on<SetYears>(_setYear);
    on<SetMonths>(_setMonths);
  }

  Future<void> _setYear(SetYears event, Emitter<CustomChartState> emit) async {
    emit(CustomChartYears(
      [
        ChartData(label: '2019', value: 15),
        ChartData(label: '2020', value: 25),
        ChartData(label: '2021', value: 115),
        ChartData(label: '2022', value: 5),
      ]
    ));
  }

  Future<void> _setMonths(SetMonths event, Emitter<CustomChartState> emit) async {
    emit(CustomChartMonths(
      [
        ChartData(label: 'Jan', value: 15),
        ChartData(label: 'Feb', value: 25),
        ChartData(label: 'Mar', value: 115),
        ChartData(label: 'Apr', value: 5),
        ChartData(label: 'May', value: 45),
        ChartData(label: 'Jun', value: 55),
        ChartData(label: 'Jul', value: 75),
        ChartData(label: 'Aug', value: 65),
        ChartData(label: 'Sep', value: 85),
        ChartData(label: 'Oct', value: 45),
        ChartData(label: 'Nov', value: 35),
        ChartData(label: 'Dec', value: 25),
      ]
    ));
  }

  Future<void> _setWeek(SetWeek event, Emitter<CustomChartState> emit) async {
    emit((CustomChartWeek(
        [
          ChartData(label: 'Mon', value: 15),
          ChartData(label: 'Tue', value: 25),
          ChartData(label: 'Wed', value: 115),
          ChartData(label: 'Thr', value: 5),
          ChartData(label: 'Fri', value: 45),
          ChartData(label: 'Sat', value: 55),
          ChartData(label: 'Sun', value: 75),
        ]
    )));
  }
}

