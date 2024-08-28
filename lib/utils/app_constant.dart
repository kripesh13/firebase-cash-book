import '../res/barrel_file.dart';

class AppConstants {
  String theme = 'theme';
  var appTheme = LocalStorageService.getTheme() == 'light';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: '',
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: '',
        languageName: 'Nepali',
        countryCode: 'NP',
        languageCode: 'ne'),
  ];

  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('ne', 'NP'),
  ];
}
