part of 'all_my_orders_cubit.dart';

@immutable
abstract class AllMyOrdersState {}

class AllMyOrdersInitial extends AllMyOrdersState {}
class AllMyOrdersLoading extends AllMyOrdersState {}
class AllMyOrdersSuccess extends AllMyOrdersState {
  final OrdersModel ordersModel;

  AllMyOrdersSuccess({required this.ordersModel});
}
class AllMyOrdersError extends AllMyOrdersState {
  final String msg;

  AllMyOrdersError({required this.msg});
}
