import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stater_project/res/app_images.dart';
import 'package:stater_project/utils/utils.dart';
import '../../res/barrel_file.dart';
import '../../provider/splash_provider.dart';
import '../../res/painter.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SplashProvider>(context);
    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.2),
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: CustomPaint(
                painter: greyCustomPainter(),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                AppImages().appLogo,
                height: 100,
              )),
              Utils.largeHeightBox(context),  
              Center(
                child: Text(
                  getTranslated('appName', context),
                  style: kkWhiteTextStyle(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
