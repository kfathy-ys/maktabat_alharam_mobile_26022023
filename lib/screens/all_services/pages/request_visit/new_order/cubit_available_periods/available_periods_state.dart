part of 'available_periods_cubit.dart';

@immutable
abstract class AvailablePeriodsState {}

class AvailablePeriodsInitial extends AvailablePeriodsState {}
class AvailablePeriodsLoading extends AvailablePeriodsState {}
class AvailablePeriodsSuccess extends AvailablePeriodsState {
  final AvailablePeriodsModel availablePeriodsModel;

  AvailablePeriodsSuccess({required this.availablePeriodsModel});
}
class AvailablePeriodsError extends AvailablePeriodsState {
  final String msg;

  AvailablePeriodsError({required this.msg});
}
class AvailablePeriodsEmpty extends AvailablePeriodsState {}
