import '../res/barrel_file.dart';

class LogingProvider extends ChangeNotifier {
  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  FocusNode emailFocus = FocusNode();

  FocusNode passwordFocus = FocusNode();
  FocusNode loginFocus = FocusNode();
  final AuthRepository authRepository;

  bool isPasswordVisibale = true;

  onPasswordVisibale() {
    isPasswordVisibale = !isPasswordVisibale; 
    notifyListeners();
  }

  bool isLoading = false;
  setLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  LogingProvider({required this.authRepository});

  Future<void> loginUser() async {
    try {
      setLoading(true);
      var data = {
        'email': emailController.text.toString(),
        'password': passwordController.text.toString(),
      };
      await authRepository.loginUser(data).then((value) async {
        setLoading(false);
        LocalStorageService.write(LocalStorageKeys.accessToken, value['token']);
        navigatorKey.currentState!
            .pushNamedAndRemoveUntil(RoutesName.homeScreen, (route) => false);
      }).onError((error, stackTrace) {
        setLoading(false);

        logger.e(error.toString());
      });
    } catch (e) {}
  }

  void facebookLoging() async {}

  void appleLoging() async {}

  void googleLoging() async {}

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    loginFocus.dispose();
    super.dispose();
  }
}
