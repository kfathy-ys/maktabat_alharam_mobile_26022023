part of 'new_order_cubit.dart';

@immutable
abstract class NewOrderState {}

class NewOrderInitial extends NewOrderState {}
class NewOrderLoading extends NewOrderState {}
class NewOrderSuccess extends NewOrderState {
  final CreateOrderAsk createOrderAsk;

  NewOrderSuccess({required this.createOrderAsk});
}
class NewOrderError extends NewOrderState {
final String msg;

  NewOrderError({required this.msg});
}
class NewOrderEmpty extends NewOrderState {}
