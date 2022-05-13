part of 'order_suggest_cubit.dart';

@immutable
abstract class OrderSuggestState {}

class OrderSuggestInitial extends OrderSuggestState {}

class OrderSuggestLoading extends OrderSuggestState {}

class OrderSuggestSuccess extends OrderSuggestState {
  final OrderSuggestModel orderSuggestModel;

  OrderSuggestSuccess({required this.orderSuggestModel});
}

class OrderSuggestError extends OrderSuggestState {
  final String meg;

  OrderSuggestError( this.meg);
}

class OrderSuggestEmpty extends OrderSuggestState {


}
