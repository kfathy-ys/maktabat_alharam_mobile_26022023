part of 'follow_research_cubit.dart';

@immutable
abstract class FollowResearchState {}

class FollowResearchInitial extends FollowResearchState {}

class FollowResearchLoading extends FollowResearchState {}

class FollowResearchSuccess extends FollowResearchState {
  final FollowResearchModel followResearchModel;

  FollowResearchSuccess({required this.followResearchModel});
}

class FollowResearchError extends FollowResearchState {
  final String msg;

  FollowResearchError({required this.msg});
}

class FollowResearchEmpty extends FollowResearchState {}
