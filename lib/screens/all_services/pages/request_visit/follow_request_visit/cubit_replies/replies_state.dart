part of 'replies_cubit.dart';

@immutable
abstract class RepliesState {}

class RepliesInitial extends RepliesState {}
class RepliesLoading extends RepliesState {}
class RepliesSuccess extends RepliesState {
  final RepliesMessagesModel repliesMessagesModel;

  RepliesSuccess({required this.repliesMessagesModel});
}
class RepliesError extends RepliesState {
  final String msg;

  RepliesError({required  this.msg });
}
class RepliesEmpty extends RepliesState {}
