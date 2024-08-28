import 'package:stater_project/res/barrel_file.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kStandardPadding(),
          child: Consumer<SignInProvider>(builder: (context, state, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getTranslated('email', context),
                  style: kkTextStyle(),
                ),
                KTextFormField(
                  controller: state.emailController,
                  prefixIcon: AppIcon().emailIcon,
                ),
                Utils.largeHeightBox(context),
                Text(getTranslated('password', context), style: kkTextStyle()),
                Utils.smallHeightBox(context),
                KTextFormField(
                  controller: state.passwordController,
                  prefixIcon: AppIcon().passwordIcon,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      state.onPasswordVisibale();
                    },
                    child: state.isPasswordVisibility
                        ? AppIcon().openEyeIcon
                        : AppIcon().closeEyeIcon,
                  ),
                  obscureText: !state.isPasswordVisibility,
                ),
                Utils.largeHeightBox(context),
                Text(getTranslated('confirmPassword', context),
                    style: kkTextStyle()),
                Utils.smallHeightBox(context),
                KTextFormField(
                  controller: state.confirmPasswordController,
                  prefixIcon: AppIcon().passwordIcon,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      state.onConfirmPasswordVisibale();
                    },
                    child: state.isConfirmPasswordVisibility
                        ? AppIcon().openEyeIcon
                        : AppIcon().closeEyeIcon,
                  ),
                  obscureText: !state.isConfirmPasswordVisibility,
                ),
                Utils.largeHeightBox(context),
                Text(getTranslated('phoneNumber', context),
                    style: kkTextStyle()),
                Utils.smallHeightBox(context),
                KTextFormField(
                  controller: state.phoneNumberController,
                  prefixIcon: AppIcon().phoneIcon,
                ),
                Utils.largeHeightBox(context),
                PrimaryButton(
                  onTap: () {
                    Utils.navigateToNamed(context, RoutesName.otpScreen);
                  },
                  text: getTranslated('signIn', context),
                  width: double.infinity,
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
