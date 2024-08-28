import 'package:stater_project/Auth/Otp_module/otp_screen.dart';
import 'package:stater_project/res/barrel_file.dart';
import 'package:stater_project/view/pages/accounts_screen.dart';
import 'package:stater_project/view/pages/payment_screen.dart';
import 'package:stater_project/view/pages/statements_screen.dart';
import 'package:stater_project/view/screen/home/home_screen.dart';

class Routes {
  static PageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.profileScreen:
        return CustomPageRouter(child: const ProfileScreen());
      case RoutesName.homeScreen:
        return CustomPageRouter(child: const HomeScreen());
      case RoutesName.noInternet:
        return CustomPageRouter(child: const NoInternetScreen());
      case RoutesName.accountScreen:
        return CustomPageRouter(child: const AccountScreen());
      case RoutesName.statementScreen:
        return CustomPageRouter(child: const StatementScreen());
      case RoutesName.paymentScreen:
        return CustomPageRouter(child: const PaymentScreen());

      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return ChangeNotifierProvider(
              create: (_) => SplashProvider(), child: const SplashScreen());
        });

      case RoutesName.loginScreen:
        return CustomPageRouter(
          child: LoginScreen(),
        );
      case RoutesName.signInScreen:
        return CustomPageRouter(child: const SignInScreen());
      case RoutesName.onBoardingScreen:
        return CustomPageRouter(child: const OnBoardingScreen());
      case RoutesName.otpScreen:
        return CustomPageRouter(child: const OtpScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Routes Defined'),
            ),
          );
        });
    }
  }
}
