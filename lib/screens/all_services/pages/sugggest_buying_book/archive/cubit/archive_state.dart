part of 'archive_cubit.dart';

@immutable
abstract class ArchiveState {}

class ArchiveInitial extends ArchiveState {}
class ArchiveLoading extends ArchiveState {}
class ArchiveSuccess extends ArchiveState {

  final OrderArchiveSuggestModel archiveSuggestModel;

  ArchiveSuccess({required this.archiveSuggestModel});
}
class ArchiveError extends ArchiveState {
  final String msg;

  ArchiveError({required this.msg});
}
class ArchiveEmpty extends ArchiveState {
  final String msg;

  ArchiveEmpty({required this.msg});
}
