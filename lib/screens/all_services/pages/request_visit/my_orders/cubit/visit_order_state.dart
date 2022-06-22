part of 'visit_order_cubit.dart';

@immutable
abstract class VisitOrderState {}

class VisitOrderInitial extends VisitOrderState {}

class VisitOrderLoading extends VisitOrderState {}

class VisitOrderSuccess extends VisitOrderState {
  final AllOrderVisitModel allOrderVisitModel;

  VisitOrderSuccess({required this.allOrderVisitModel});
}

class VisitOrderError extends VisitOrderState {
  final String msg;

  VisitOrderError({required this.msg});
}

class VisitOrderEmpty extends VisitOrderState {}
