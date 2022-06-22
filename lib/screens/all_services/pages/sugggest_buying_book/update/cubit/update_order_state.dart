part of 'update_order_cubit.dart';

@immutable
abstract class UpdateOrderState {}

class UpdateOrderInitial extends UpdateOrderState {}

class UpdateOrderLoading extends UpdateOrderState {}

class UpdateOrderSuccess extends UpdateOrderState {
  final OrderUpdateSuggestModel orderUpdateSuggestModel;

  UpdateOrderSuccess({required this.orderUpdateSuggestModel});
}

class UpdateOrderError extends UpdateOrderState {
  final String msg;

  UpdateOrderError(this.msg);
}
