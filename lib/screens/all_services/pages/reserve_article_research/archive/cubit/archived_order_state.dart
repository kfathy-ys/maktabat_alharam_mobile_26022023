part of 'archived_order_cubit.dart';

@immutable
abstract class ArchivedOrderState {}

class ArchivedOrderInitial extends ArchivedOrderState {}
class ArchivedOrderLoading extends ArchivedOrderState {}
class ArchivedOrderSuccess extends ArchivedOrderState {
  final ArchivedResearchModel archivedResearchModel;

  ArchivedOrderSuccess({required this.archivedResearchModel});
}
class ArchivedOrderError extends ArchivedOrderState {
  final String msg;

  ArchivedOrderError({required this.msg});
}
class ArchivedOrderEmpty extends ArchivedOrderState {}
