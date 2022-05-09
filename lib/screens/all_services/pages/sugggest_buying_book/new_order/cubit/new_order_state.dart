part of 'new_order_cubit.dart';

@immutable
abstract class NewOrderState {}

class NewOrderInitial extends NewOrderState {}
class NewOrderLoading extends NewOrderState {}
class NewOrderSuccess extends NewOrderState {
  final CreateOrderModel createOrderModel;

  NewOrderSuccess({required this.createOrderModel});
}
class NewOrderError extends NewOrderState {
  final String msg;

  NewOrderError({required this.msg});

}
