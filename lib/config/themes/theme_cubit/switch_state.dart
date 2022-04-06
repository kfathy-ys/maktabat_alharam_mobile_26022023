import 'package:flutter/material.dart';

import '../app_theme.dart';

class SwitchState {
  final bool isDarkThemeOn;
  ThemeData? theme;
  SwitchState({required this.isDarkThemeOn}) {
    if (isDarkThemeOn) {
      theme = appThemeData[AppTheme.DarkAppTheme];
    } else {
      theme = appThemeData[AppTheme.LightAppTheme];
    }
  }

  SwitchState copyWith({required bool changeState}) {
    return SwitchState(isDarkThemeOn: changeState);
  }
}