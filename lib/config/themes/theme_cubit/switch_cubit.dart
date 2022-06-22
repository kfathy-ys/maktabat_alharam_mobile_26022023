import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/config/themes/theme_cubit/switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchState(isDarkThemeOn: true));

  void toggleSwitch(bool value) => emit(state.copyWith(changeState: value));
}
