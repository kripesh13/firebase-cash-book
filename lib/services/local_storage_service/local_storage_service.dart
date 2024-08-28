import 'package:get_storage/get_storage.dart';

import '../../res/barrel_file.dart';

class LocalStorageKeys {
  static const accessToken = "AccessToken";
  static const language = "Language";
  static const registerToken = "RegisterToken";
  static const isFirstTime = "isFirstTime";
  static const userId = "userId";
  static const appTheme = "AppTheme";
}

class LocalStorageService {
  static final GetStorage _storage = GetStorage();

  static Future<void> init() async {
    try {
      await GetStorage.init();
    } catch (e) {
      logger.e('Failed to initialize GetStorage: $e');
    }
  }

  static String? read(String key) {
    print('Read gareko key $key');
    return _storage.read(key);
  }

  static bool? readBool(String key) {
    return _storage.read(key);
  }

  static Future<void> write(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  static Future<void> clear(String key) async {
    await _storage.remove(key);
  }

  static bool isEmpty(String key) {
    return _storage.read(key) == null;
  }

  static bool isNotEmpty(String key) {
    return _storage.read(key) != null;
  }

  static Future<void> setTheme(String theme) async {
    await write(LocalStorageKeys.appTheme, theme);
  }

  static String? getTheme() {
    return read(LocalStorageKeys.appTheme);
  }

  static Future<void> setLanguage(String language) async {
    await write(LocalStorageKeys.language, language);
  }
}
