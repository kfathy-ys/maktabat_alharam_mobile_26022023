part of 'my_archive_visit_cubit.dart';

@immutable
abstract class MyArchiveVisitState {}

class MyArchiveVisitInitial extends MyArchiveVisitState {}
class MyArchiveVisitLoading extends MyArchiveVisitState {}
class MyArchiveVisitSuccess extends MyArchiveVisitState {
  final ArchiveVisitModel archiveVisitModel;

  MyArchiveVisitSuccess({required this.archiveVisitModel});
}
class MyArchiveVisitError extends MyArchiveVisitState {
  final String msg;

  MyArchiveVisitError({required this.msg});
}
class MyArchiveVisitEmpty extends MyArchiveVisitState {}
