part of 'custom_chart_bloc.dart';

abstract class CustomChartState {
  List<ChartData>? data;
  CustomChartState(this.data);
}
class CustomChartInitial extends CustomChartState{
  CustomChartInitial()  : super(null);
}

class CustomChartWeek extends CustomChartState {
  CustomChartWeek(super.data);
}
class CustomChartMonths extends CustomChartState {
  CustomChartMonths(super.data);
}
class CustomChartYears extends CustomChartState {
  CustomChartYears(super.data);
}
