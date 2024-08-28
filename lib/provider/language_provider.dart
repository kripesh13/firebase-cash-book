import 'package:stater_project/res/barrel_file.dart';

class LanguageProvider extends ChangeNotifier {
  Locale locale = Locale('en');
  onChangelanguage({Locale? locale}) async {
    await LocalStorageService.setLanguage(locale.toString());
    this.locale = locale!;
    notifyListeners();
  }




}
