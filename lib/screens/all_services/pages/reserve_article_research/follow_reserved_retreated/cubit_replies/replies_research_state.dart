part of 'replies_research_cubit.dart';

@immutable
abstract class RepliesResearchState {}

class RepliesResearchInitial extends RepliesResearchState {}

class RepliesResearchLoading extends RepliesResearchState {}

class RepliesResearchSuccess extends RepliesResearchState {
  final RepliesResearchModel repliesResearchModel;

  RepliesResearchSuccess({required this.repliesResearchModel});
}

class RepliesResearchError extends RepliesResearchState {
  final String msg;

  RepliesResearchError({required this.msg});
}

class RepliesResearchEmpty extends RepliesResearchState {}
