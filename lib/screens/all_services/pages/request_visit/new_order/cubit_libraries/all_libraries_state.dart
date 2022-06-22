part of 'all_libraries_cubit.dart';

@immutable
abstract class AllLibrariesState {}

class AllLibrariesInitial extends AllLibrariesState {}

class AllLibrariesLoading extends AllLibrariesState {}

class AllLibrariesSuccess extends AllLibrariesState {
  final AllLibrariesModel allLibrariesModel;

  AllLibrariesSuccess({required this.allLibrariesModel});
}

class AllLibrariesError extends AllLibrariesState {
  final String msg;

  AllLibrariesError({required this.msg});
}

class AllLibrariesEmpty extends AllLibrariesState {}
