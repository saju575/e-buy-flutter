import 'package:e_buy/features/settings/domain/models/theme_value.dart';
import 'package:e_buy/features/settings/domain/repositories/theme_repository.dart';

class ThemeUseCase {
  final ThemeRepository _themeRepository;
  ThemeUseCase({required ThemeRepository themeRepository})
    : _themeRepository = themeRepository;

  List<ThemeValue> get getThemeList => _themeRepository.getThemeList;

  ThemeValue get getThemeMode {
    final themeValue = _themeRepository.getThemeModeFromLocalStorage();
    for (var i = 0; i < getThemeList.length; i++) {
      if (themeValue.value == getThemeList[i].value) {
        return getThemeList[i];
      }
    }
    return getThemeList.last;
  }

  Future<void> setThemeMode(ThemeValue themeValue) =>
      _themeRepository.setThemeModeToLocalStorage(themeValue);
}
