part of 'ask_archive_cubit.dart';

@immutable
abstract class AskArchiveState {}

class AskArchiveInitial extends AskArchiveState {}
class AskArchiveLoading extends AskArchiveState {}
class AskArchiveSuccess extends AskArchiveState {
  final AskArchivedModel askArchivedModel;

  AskArchiveSuccess({required this.askArchivedModel});
}
class AskArchiveError extends AskArchiveState {
  final String msg;

  AskArchiveError({required this.msg});
}
class AskArchiveEmpty extends AskArchiveState {}
