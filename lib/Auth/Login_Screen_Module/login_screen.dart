import 'package:stater_project/res/custom_text_form_field.dart';
import 'package:stater_project/res/k_button.dart';
import '../../res/barrel_file.dart';
import '../../res/painter.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    super.key,
  });
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage(AppImages().bg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Consumer<LogingProvider>(
          builder: (context, state, child) {
            // print(state.isLoading);

            return Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: greyCustomPainter(),
                  ),
                ),
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Center(
                              child: Image.asset(
                            AppImages().appLogoBlack,
                            height: 150,
                          )),
                          Text(
                            getTranslated('welcomeTo', context),
                            style: kkWhiteTextStyle().copyWith(
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            getTranslated('appName', context),
                            style: kkWhiteTextStyle().copyWith(fontSize: 22),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    width: 0.5,
                                    color: whiteColor.withOpacity(0.4)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(31, 255, 255, 255),
                                    blurRadius: 5,
                                    offset: Offset(0, 0),
                                  ),
                                ]),
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Utils.mediumHeightBox(context),
                                Text(
                                  'Email',
                                  style: kkWhiteTextStyle(),
                                ),
                                Utils.mediumHeightBox(context),
                                CustomTextFormField(
                                    controller: state.emailController,
                                    hint: 'example@gmail.com',
                                    prefixIcon: AppIcon().emailIcon,
                                    focusNode: state.emailFocus,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      if (!Utils.isValidEmail(state
                                          .emailController.text
                                          .toString())) {
                                        return 'Please enter a valid email';
                                      }

                                      return null;
                                    },
                                    onFieldSubmitted: (val) {
                                      Utils.fieldFocusNode(
                                          context,
                                          state.passwordFocus,
                                          state.emailFocus);
                                    }),
                                Utils.mediumHeightBox(context),
                                Text(
                                  'Password',
                                  style: kkWhiteTextStyle(),
                                ),
                                Utils.mediumHeightBox(context),
                                CustomTextFormField(
                                  controller: state.passwordController,
                                  focusNode: state.passwordFocus,
                                  onFieldSubmitted: (val) {
                                    Utils.fieldFocusNode(
                                      context,
                                      state.loginFocus,
                                      state.passwordFocus,
                                    );
                                  },
                                  obscureText: state.isPasswordVisibale,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters long';
                                    }
                                    return null;
                                  },
                                  hint: '********',
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        state.onPasswordVisibale();
                                      },
                                      child: state.isPasswordVisibale
                                          ? AppIcon().closeEyeIcon
                                          : AppIcon().openEyeIcon),
                                  prefixIcon: AppIcon().lockIcon,
                                ),
                                Utils.mediumHeightBox(context),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'Forgot Password?',
                                        style: kTextStyle().copyWith(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                          decorationColor: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Utils.largeHeightBox(context),
                                state.isLoading
                                    ? CustomLoadingIndicator()
                                    : Container(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          focusNode: state.loginFocus,
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              // If the form is valid, proceed with login
                                              state.loginUser();
                                            }
                                          },
                                          style: ButtonStyle(
                                            shadowColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              amberColor,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                state.isLoading == true
                                                    ? CustomLoadingIndicator()
                                                    : Text(
                                                        getTranslated(
                                                            'logIn', context),
                                                        style: kkBoldTextStyle()
                                                            .copyWith(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                Utils.largeHeightBox(context),
                                Utils.mediumHeightBox(context),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      getTranslated(
                                          'dontHaveAnAccount', context),
                                      style: kkWhiteTextStyle(),
                                    ),
                                    Utils.mediumHeightBox(context),
                                    InkWell(
                                      onTap: () {
                                        Utils.navigateToNamed(
                                            context, RoutesName.signInScreen);
                                      },
                                      child: Text(
                                        getTranslated('signIn', context),
                                        style: kBoldTextStyle().copyWith(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                          decorationColor: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Utils.largeHeightBox(context),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    KButton(
                                        onPressed: () {
                                          state.googleLoging();
                                        },
                                        child: AppIcon().googleIcon),
                                    KButton(
                                        onPressed: () {
                                          state.appleLoging();
                                        },
                                        child: AppIcon().appleIcon),
                                    KButton(
                                        onPressed: () {
                                          state.facebookLoging();
                                        },
                                        child: AppIcon().facebookIcon),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Utils.largeHeightBox(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
