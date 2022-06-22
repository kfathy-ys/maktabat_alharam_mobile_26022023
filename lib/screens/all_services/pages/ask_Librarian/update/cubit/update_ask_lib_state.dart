part of 'update_ask_lib_cubit.dart';

@immutable
abstract class UpdateAskLibState {}

class UpdateAskLibInitial extends UpdateAskLibState {}

class UpdateAskLibLoading extends UpdateAskLibState {}

class UpdateAskLibSuccess extends UpdateAskLibState {
  final UpdateAskModel updateAskModel;

  UpdateAskLibSuccess({required this.updateAskModel});
}

class UpdateAskLibError extends UpdateAskLibState {
  final String msg;

  UpdateAskLibError({required this.msg});
}

class UpdateAskLibEmpty extends UpdateAskLibState {}
