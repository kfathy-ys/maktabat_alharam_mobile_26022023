part of 'order_thesis_cubit.dart';

@immutable
abstract class OrderThesisState {}

class OrderThesisInitial extends OrderThesisState {}
class OrderThesisLoading extends OrderThesisState {}
class OrderThesisSuccess extends OrderThesisState {
  final OrderThesisModel orderThesisModel;

  OrderThesisSuccess({required this.orderThesisModel});
}
class OrderThesisError extends OrderThesisState {
  final String msg;

  OrderThesisError({required this.msg});
}
class OrderThesisEmpty extends OrderThesisState {}
