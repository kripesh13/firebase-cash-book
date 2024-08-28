import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stater_project/res/app_fonts.dart';
import 'package:stater_project/utils/utils.dart';

import '../../res/barrel_file.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnBoardingProvider>(
        builder: (context, state, _) {
          return Stack(
            children: [
              PageView(
                onPageChanged: (value) {
                  state.onChangeLastPage(value);
                },
                controller: state.pageController,
                children: [
                  Container(
                    color: blueColor,
                  ),
                  Container(
                    color: redColor,
                  ),
                  Container(
                    color: tealColor,
                  ),
                ],
              ),
              Container(
                alignment: const Alignment(0, 0.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          state.pageController.jumpToPage(2);
                        },
                        child: Text(
                          getTranslated('skip', context),
                          style: kkWhiteTextStyle(),
                        )),
                    SmoothPageIndicator(
                        controller: state.pageController, count: 3),
                    state.onLastPage
                        ? GestureDetector(
                            onTap: () {
                              Utils.navigateToNamed(
                                  context, RoutesName.loginScreen);
                            },
                            child: Text(
                              getTranslated('continue', context),
                              style: kkWhiteTextStyle(),
                            ))
                        : GestureDetector(
                            onTap: () {
                              state.pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: Text(
                              getTranslated('next', context),
                              style: kkWhiteTextStyle(),
                            )),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
