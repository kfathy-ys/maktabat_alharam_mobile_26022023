part of 'follow_cubit.dart';

@immutable
abstract class FollowState {}

class FollowInitial extends FollowState {}
class FollowLoading extends FollowState {}
class FollowSuccess extends FollowState {
  final AllAskFollowModel allAskFollowModel;

  FollowSuccess({required this.allAskFollowModel});
}
class FollowError extends FollowState {
  final String msg;

  FollowError({required this.msg});
}
class FollowEmpty extends FollowState {

}

