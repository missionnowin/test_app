part of 'custom_chart_bloc.dart';

@immutable
abstract class CustomChartEvent {}
class SetYears extends CustomChartEvent{}
class SetMonths extends CustomChartEvent {}
class SetWeek extends CustomChartEvent {}
