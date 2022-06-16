part of 'thesis_replies_cubit.dart';

@immutable
abstract class ThesisRepliesState {}

class ThesisRepliesInitial extends ThesisRepliesState {}
class ThesisRepliesLoading extends ThesisRepliesState {}
class ThesisRepliesSuccess extends ThesisRepliesState {
  final AllRepliesThesisModel allRepliesThesisModel;

  ThesisRepliesSuccess({required this.allRepliesThesisModel});
}
class ThesisRepliesError extends ThesisRepliesState {
  final String msg;

  ThesisRepliesError({required this.msg});
}

