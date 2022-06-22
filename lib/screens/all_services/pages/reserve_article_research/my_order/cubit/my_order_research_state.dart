part of 'my_order_research_cubit.dart';

@immutable
abstract class MyOrderResearchState {}

class MyOrderResearchInitial extends MyOrderResearchState {}

class MyOrderResearchLoading extends MyOrderResearchState {}

class MyOrderResearchSuccess extends MyOrderResearchState {
  final OrderResearchModel orderResearchModel;

  MyOrderResearchSuccess({required this.orderResearchModel});
}

class MyOrderResearchError extends MyOrderResearchState {
  final String msg;

  MyOrderResearchError({required this.msg});
}

class MyOrderResearchEmpty extends MyOrderResearchState {}
