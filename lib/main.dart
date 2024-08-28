import 'package:firebase_core/firebase_core.dart';

import 'res/barrel_file.dart';
import 'package:stater_project/injection.dart' as di;
import 'Theme/light_theme.dart';
import 'utils/localization/app_localization.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocalStorageService.init();
  await di.init();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = primaryColor
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MultiProvider(
        providers: MultiProviderRoutes().multiProvider,
        child: Consumer3<ThemeProvider, LanguageProvider, Internetprovider>(
          builder:
              (context, themeProvider, languageProvider, internetProvider, _) {
            String languageLocale =
                LocalStorageService.read(LocalStorageKeys.language) ?? 'en';

            final themeMode =
                AppConstants().appTheme ? ThemeMode.light : ThemeMode.dark;

            return internetProvider.isConnected
                ? MaterialApp(
                    locale: Locale(languageLocale),
                    supportedLocales: AppConstants.supportedLocales,
                    localizationsDelegates: const [
                      AppLocalization.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    navigatorKey: navigatorKey,
                    title: 'Flutter Demo',
                    themeMode: themeMode,
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    initialRoute: RoutesName.homeScreen,
                    onGenerateRoute: Routes.generateRoute,
                    builder: EasyLoading.init(),
                  )
                : const NoInternetScreen();
          },
        ),
      ),
    );
  }
}
