import 'package:e_buy/features/settings/domain/models/theme_value.dart';

abstract class ThemeRepository {
  Future<void> setThemeModeToLocalStorage(ThemeValue themeValue);
  ThemeValue getThemeModeFromLocalStorage();

  List<ThemeValue> get getThemeList;
}
