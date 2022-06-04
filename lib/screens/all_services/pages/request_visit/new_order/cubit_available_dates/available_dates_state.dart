part of 'available_dates_cubit.dart';

@immutable
abstract class AvailableDatesState {}

class AvailableDatesInitial extends AvailableDatesState {}
class AvailableDatesLoading extends AvailableDatesState {}
class AvailableDatesSuccess extends AvailableDatesState {
  final AvailableDatesModel availableDatesModel;
  final List<AvailableDates> dates;

  AvailableDatesSuccess({required this.dates,required this.availableDatesModel});
}
class AvailableDatesError extends AvailableDatesState {
  final String msg;

  AvailableDatesError({required this.msg});
}
class AvailableDatesEmpty extends AvailableDatesState {}


class AvailablePeriodLoading extends AvailableDatesState {}
class AvailablePeriodSuccess extends AvailableDatesState {}
class AvailablePeriodError extends AvailableDatesState {
  final String msg;

  AvailablePeriodError({required this.msg});
}


class CreateOrderInitial extends AvailableDatesState {}
class CreateOrderLoading extends AvailableDatesState {}
class CreateOrderSuccess extends AvailableDatesState {
  final MyOrderToVisit myOrderToVisit;

  CreateOrderSuccess({required this.myOrderToVisit});
}
class CreateOrderError extends AvailableDatesState {
  final String msg;

  CreateOrderError({required this.msg});
}
class CreateOrderEmpty extends AvailableDatesState {}
