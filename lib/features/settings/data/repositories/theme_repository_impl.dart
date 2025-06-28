import 'package:e_buy/features/settings/data/datasources/theme_local_datasources.dart';
import 'package:e_buy/features/settings/data/models/theme_value_dto.dart';
import 'package:e_buy/features/settings/domain/models/theme_value.dart';
import 'package:e_buy/features/settings/domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDatasources _themeLocalDatasources;

  ThemeRepositoryImpl({required ThemeLocalDatasources themeLocalDatasources})
    : _themeLocalDatasources = themeLocalDatasources;

  @override
  ThemeValue getThemeModeFromLocalStorage() {
    final themeData = _themeLocalDatasources.getThemeFromLocalStorage();
    return themeData.toDomain();
  }

  @override
  Future<void> setThemeModeToLocalStorage(ThemeValue themeValue) async {
    await _themeLocalDatasources.saveThemeToLocalStorage(
      ThemeValueDto(title: themeValue.title, value: themeValue.value),
    );
  }

  @override
  List<ThemeValue> get getThemeList =>
      _themeLocalDatasources.getThemeList.map((dto) => dto.toDomain()).toList();
}
