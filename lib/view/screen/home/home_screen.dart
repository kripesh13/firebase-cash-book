import 'package:stater_project/res/barrel_file.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: kStandardPadding(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.92,
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    offset: Offset(2, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                  )
                ],
                color: const Color.fromRGBO(250, 250, 250, 1),
                border: Border.all(
                    width: 2, color: Color.fromRGBO(75, 144, 101, 0.1)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HomeTiles(
                    shadowsColor: Colors.black26,
                    color: Color.fromARGB(255, 230, 174, 173),
                    image: AppImages().payments,
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.paymentScreen);
                    },
                    title: 'To Recive',
                  ),
                  HomeTiles(
                    shadowsColor: Colors.black.withOpacity(0.2),
                    color: Color(0xffB5BAED),
                    image: AppImages().statements,
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.statementScreen);
                    },
                    title: 'To Pay',
                  ),
                  HomeTiles(
                    shadowsColor: Colors.black.withOpacity(0.2),
                    color: Color(0xffCCE6CC),
                    image: AppImages().accounts,
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.accountScreen);
                    },
                    title: 'Accounts',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeTiles extends StatelessWidget {
  String? title;
  String? image;
  void Function()? onTap;
  Color? color;
  Color? shadowsColor;

  HomeTiles({
    this.onTap,
    this.color,
    this.image,
    this.shadowsColor,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InnerShadow(
            shadows: [
              Shadow(blurRadius: 4, color: shadowsColor!, offset: Offset(4, 4))
            ],
            child: Container(
              padding: EdgeInsets.all(20),
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                image!,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Utils.mediumHeightBox(context),
          Text(
            title!,
            style: TextStyle(
                fontSize: 16), // You can adjust the font size as needed
          ),
        ],
      ),
    );
  }
}
