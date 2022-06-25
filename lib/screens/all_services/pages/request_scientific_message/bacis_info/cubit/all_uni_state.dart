part of 'all_uni_cubit.dart';

@immutable
abstract class AllUniState {}

class AllUniInitial extends AllUniState {}
class AllUniloading extends AllUniState {}
class AllUniSuccess extends AllUniState {
  final AllUniversityModel allUniversityModel;

  AllUniSuccess({required this.allUniversityModel});
}
class AllUniEmpty extends AllUniState {
  final String msg;

  AllUniEmpty({required this.msg});

}
