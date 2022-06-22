part of 'follow_visit_cubit.dart';

@immutable
abstract class FollowVisitState {}

class FollowVisitInitial extends FollowVisitState {}

class FollowVisitLoading extends FollowVisitState {}

class FollowVisitSuccess extends FollowVisitState {
  final FollowOrderVisitModel followOrderVisitModel;

  FollowVisitSuccess({required this.followOrderVisitModel});
}

class FollowVisitEmpty extends FollowVisitState {}

class FollowVisitError extends FollowVisitState {
  final String msg;

  FollowVisitError({required this.msg});
}
