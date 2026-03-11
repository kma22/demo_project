abstract interface class BaseThemeStorage {
  String? getTheme();

  Future<void> saveTheme(String themeName);
}
