import '../res/barrel_file.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider() {
    checkFirst();
  }

  void checkToken() async {
    var token = await LocalStorageService.read(LocalStorageKeys.accessToken);
    var language = await LocalStorageService.read(LocalStorageKeys.language);

    print('yo suruko token ho $token');
    print('yo suruko language ho $language');

    if (token == null || token == '' || token.isEmpty) {
      await Future.delayed(const Duration(seconds: 2), () {
        navigatorKey.currentState!
            .pushNamedAndRemoveUntil(RoutesName.loginScreen, (route) => false);
      });
    } else {
      await Future.delayed(const Duration(seconds: 2), () {
        navigatorKey.currentState!
            .pushNamedAndRemoveUntil(RoutesName.homeScreen, (route) => false);
      });
    }
  }

  checkFirst() {
    bool? isFirstTime =
        LocalStorageService.readBool(LocalStorageKeys.isFirstTime);
    print(isFirstTime);
    if (isFirstTime == null) {
      Future.delayed(Duration(seconds: 2), () {
        navigatorKey.currentState!.pushNamedAndRemoveUntil(
            RoutesName.onBoardingScreen, (route) => false);
      });
    } else {
      Future.delayed(Duration(seconds: 2), () {
        navigatorKey.currentState!
            .pushNamedAndRemoveUntil(RoutesName.loginScreen, (route) => false);
        checkToken();
      });
    }
  }
}
