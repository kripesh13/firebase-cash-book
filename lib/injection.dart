import 'package:get_it/get_it.dart';
import 'package:stater_project/provider/payment_provider.dart';

import 'res/barrel_file.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // core
  sl.registerLazySingleton<BaseApiServices>(() => NetworkApiServices(
        baseUrl: AipName.baseUrl,
      ));
  // Repository
  sl.registerLazySingleton(() => AuthRepository(
        apiServices: sl(),
      ));

  // Register providers
  sl.registerFactory(() => ThemeProvider());
  sl.registerFactory(() => LogingProvider(authRepository: sl()));
  sl.registerFactory(() => SplashProvider());
  sl.registerFactory(() => LanguageProvider());
  sl.registerFactory(() => Internetprovider());
  sl.registerFactory(() => OnBoardingProvider());
  sl.registerFactory(() => SignInProvider());
  sl.registerFactory(() => PaymentProvider());
}
