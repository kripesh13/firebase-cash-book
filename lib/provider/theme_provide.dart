import '../res/barrel_file.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    onToggleThemeEvent(isDark);
  }
  bool isDark = LocalStorageService.getTheme() == 'dark';

  void onToggleThemeEvent(bool isDark) async {
    await LocalStorageService.setTheme(isDark ? 'dark' : 'light');
    this.isDark = isDark;
    notifyListeners();
  }
}
