part of 'create_order_cubit.dart';

@immutable
abstract class CreateOrderState {}

class CreateOrderInitial extends CreateOrderState {}
class CreateOrderLoading extends CreateOrderState {}
class CreateOrderSuccess extends CreateOrderState {
  final MyOrderToVisit myOrderToVisit;

  CreateOrderSuccess({required this.myOrderToVisit});
}
class CreateOrderError extends CreateOrderState {
  final String msg;

  CreateOrderError({required this.msg});
}
class CreateOrderEmpty extends CreateOrderState {}
