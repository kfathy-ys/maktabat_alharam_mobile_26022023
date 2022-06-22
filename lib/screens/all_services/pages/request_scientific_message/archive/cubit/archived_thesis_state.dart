part of 'archived_thesis_cubit.dart';

@immutable
abstract class ArchivedThesisState {}

class ArchivedThesisInitial extends ArchivedThesisState {}

class ArchivedThesisLoading extends ArchivedThesisState {}

class ArchivedThesisSuccess extends ArchivedThesisState {
  final ArchivedThesisModel archivedThesisModel;

  ArchivedThesisSuccess({required this.archivedThesisModel});
}

class ArchivedThesisError extends ArchivedThesisState {
  final String msg;

  ArchivedThesisError({required this.msg});
}

class ArchivedThesisEmpty extends ArchivedThesisState {}
