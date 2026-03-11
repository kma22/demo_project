import 'package:injectable/injectable.dart';
import 'package:local_storage/src/storage_keys.dart';
import 'package:local_storage/src/theme_storage/base_theme_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: BaseThemeStorage)
class ThemeStorage implements BaseThemeStorage {
  final SharedPreferences _sharedPreferences;

  ThemeStorage(this._sharedPreferences);

  @override
  String? getTheme() {
    return _sharedPreferences.getString(StorageKeys.themeKey);
  }

  @override
  Future<void> saveTheme(String themeName) async {
    await _sharedPreferences.setString(StorageKeys.themeKey, themeName);
  }
}
