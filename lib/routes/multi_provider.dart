import 'package:provider/single_child_widget.dart';
import 'package:stater_project/injection.dart' as di;
import 'package:stater_project/provider/payment_provider.dart';
import '../res/barrel_file.dart';

class MultiProviderRoutes {
  List<SingleChildWidget> multiProvider = [
    ChangeNotifierProvider(create: (_) => di.sl<LanguageProvider>()),
    ChangeNotifierProvider(create: (_) => di.sl<ThemeProvider>()),
    ChangeNotifierProvider(create: (_) => di.sl<LogingProvider>()),
    ChangeNotifierProvider(create: (_) => di.sl<Internetprovider>()),
    ChangeNotifierProvider(create: (_) => di.sl<OnBoardingProvider>()),
    ChangeNotifierProvider(create: (_) => di.sl<SignInProvider>()),
    ChangeNotifierProvider(create: (_) => di.sl<PaymentProvider>()),

    // ChangeNotifierProvider(create: (_) =>   di.sl<TutorialProvider>() ),
  ];
}
