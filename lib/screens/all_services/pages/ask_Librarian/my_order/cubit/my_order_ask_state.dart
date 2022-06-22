part of 'my_order_ask_cubit.dart';

@immutable
abstract class MyOrderAskState {}

class MyOrderAskInitial extends MyOrderAskState {}

class MyOrderAskLoading extends MyOrderAskState {}

class MyOrderAskSuccess extends MyOrderAskState {
  final AskOrderModel askOrderModel;
  MyOrderAskSuccess({required this.askOrderModel});
}

class MyOrderAskError extends MyOrderAskState {
  final String msg;

  MyOrderAskError({required this.msg});
}

class MyOrderAskEmpty extends MyOrderAskState {}
