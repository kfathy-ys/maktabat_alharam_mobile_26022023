part of 'update_visit_order_cubit.dart';

@immutable
abstract class UpdateVisitOrderState {}

class UpdateVisitOrderInitial extends UpdateVisitOrderState {}
class UpdateVisitOrderLoading extends UpdateVisitOrderState {}
class UpdateVisitOrderSuccess extends UpdateVisitOrderState {
  final UpdateVisitRequestModel updateVisitRequestModel;

  UpdateVisitOrderSuccess({required this.updateVisitRequestModel});
}
class UpdateVisitOrderError extends UpdateVisitOrderState {
  final String msg;

  UpdateVisitOrderError({required this.msg});
}
class UpdateVisitOrderEmpty extends UpdateVisitOrderState {}


class UpdateAvailableDatesInitial extends UpdateVisitOrderState {}
class UpdateAvailableDatesLoading extends UpdateVisitOrderState {}
class UpdateAvailableDatesSuccess extends UpdateVisitOrderState {
  final AvailableDatesModel availableDatesModel;
  final List<AvailableDates> dates;

  UpdateAvailableDatesSuccess({required this.dates,required this.availableDatesModel});
}
class UpdateAvailableDatesError extends UpdateVisitOrderState {
  final String msg;

  UpdateAvailableDatesError({required this.msg});
}
class UpdateAvailableDatesEmpty extends UpdateVisitOrderState {}


class UpdateAvailablePeriodLoading extends UpdateVisitOrderState {}
class UpdateAvailablePeriodSuccess extends UpdateVisitOrderState {}
class UpdateAvailablePeriodError extends UpdateVisitOrderState {
  final String msg;

  UpdateAvailablePeriodError({required this.msg});
}
