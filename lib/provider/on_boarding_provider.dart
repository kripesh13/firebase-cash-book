import 'package:flutter/material.dart';
import 'package:stater_project/res/barrel_file.dart';

class OnBoardingProvider extends ChangeNotifier {
  PageController pageController = PageController();
  bool onLastPage = false;
  onChangeLastPage(val) {
    onLastPage = (val == 2);
    logger.i(val);
    logger.i(onLastPage);
    notifyListeners();
  }
}
