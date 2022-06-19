part of 'avalible_dates_research_cubit.dart';

@immutable
abstract class AvalibleDatesResearchState {}




class AvalibleDatesResearchInitial extends AvalibleDatesResearchState {}
class ServiceSelecetdState extends AvalibleDatesResearchState {}
class SelectedDatesState extends AvalibleDatesResearchState {}
class AvalibleDatesResearchLoading extends AvalibleDatesResearchState {}
class AvalibleDatesResearchSuccess extends AvalibleDatesResearchState {
  // final AvailableDatesByRoomModel availableDatesByRoomModel;
  // final List<AvailableDatesByRoom> dates;

  AvalibleDatesResearchSuccess();
}
class AvalibleDatesResearchError extends AvalibleDatesResearchState {
  final String msg;

  AvalibleDatesResearchError({required this.msg});
}
class AvalibleDatesResearchEmpty extends AvalibleDatesResearchState {}


class AvailablePeriodLoading extends AvalibleDatesResearchState {}
class AvailablePeriodSuccess extends AvalibleDatesResearchState {}
class AvailablePeriodError extends AvalibleDatesResearchState {
  final String msg;

  AvailablePeriodError({required this.msg});
}


class CreateOrderInitial extends AvalibleDatesResearchState {}
class CreateOrderLoading extends AvalibleDatesResearchState {}
class CreateOrderSuccess extends AvalibleDatesResearchState {
  final MyOrdersToResearch myOrdersToResearch;

  CreateOrderSuccess({required this.myOrdersToResearch});
}
class CreateOrderError extends AvalibleDatesResearchState {
  final String msg;

  CreateOrderError({required this.msg});
}
class CreateOrderEmpty extends AvalibleDatesResearchState {}