import 'package:stater_project/res/barrel_file.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import '../res/tutorial_guide.dart';

class TutorialProvider extends ChangeNotifier {
  TutorialCoachMark? tutorialCoachMarkResponse;
  final List<TargetFocus> targets = [];
  final GlobalKey searchKey = GlobalKey();
  final GlobalKey menuKey = GlobalKey();
  final GlobalKey locationKey = GlobalKey();

  TutorialProvider({context}) {
    _initializeTutorial(context);
  }

  void _initializeTutorial(context) {
    _setTargets();
    _showTutorialWithDelay(context);
  }

  void _setTargets() {
    targets.addAll([
      _createTarget(
        key: searchKey,
        identify: 'search',
        text:
            'You can search for whatever is required here with the help of this app',
        nextLabel: 'Next',
        skipLabel: 'Skip',
      ),
      _createTarget(
        key: menuKey,
        identify: 'Menu key',
        text: 'This menu bar gives you easy control to more features',
        nextLabel: 'Next',
        skipLabel: 'Skip',
      ),
      _createTarget(
        key: locationKey,
        identify: 'Location Key',
        text:
            'This is your location. You can change the location of your place and set a new location as per your preference.',
        nextLabel: 'Finish',
        skipLabel: 'Skip',
      ),
    ]);
  }

  TargetFocus _createTarget({
    required GlobalKey key,
    required String identify,
    required String text,
    required String nextLabel,
    required String skipLabel,
  }) {
    return TargetFocus(
      identify: identify,
      keyTarget: key,
      contents: [
        TargetContent(
          builder: (context, controller) {
            return TutorialGuide(
              onNext: () {
                controller.next();
                notifyListeners();
              },
              onSkip: () {
                controller.skip();
                notifyListeners();
              },
              text: text  ,
              next: nextLabel,
              skip: skipLabel,
            );
          },
        ),
      ],
    );
  }

  void _showTutorialWithDelay(context) {
    Future.delayed(const Duration(milliseconds: 100), () {
      _showTutorial(context);
    });
  }

  void _showTutorial(context) {
    tutorialCoachMarkResponse = TutorialCoachMark(
      targets: targets,
      colorShadow: const Color.fromARGB(255, 0, 0, 0),
      opacityShadow: 0.97,
      hideSkip: true,
    )..show(context: context);
  }
}
