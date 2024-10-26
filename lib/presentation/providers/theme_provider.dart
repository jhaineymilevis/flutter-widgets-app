import 'package:flutter_application_1/config/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDarkModeProvider = StateProvider<bool>(
  (ref) => false,
);
final selectedColorProvider = StateProvider<int>(
  (ref) => 0,
);

//state inmutable
final colorListProvider = Provider(
  (ref) => colorList,
);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

//controller or notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  //state == new instance of AppTheme
  ThemeNotifier() : super(AppTheme());

  void togleDarkMode() {
    state = state.copyWith(
      isDarkMode: !state.isDarkMode,
    );
  }

  void setColor(int index) {
    state = state.copyWith(selectedColor: index);
  }
}
