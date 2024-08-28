import 'barrel_file.dart';

class TutorialGuide extends StatelessWidget {
  String? text;
  String? skip;
  String? next;
  final void Function()? onSkip;
  final void Function()? onNext;
  TutorialGuide({this.next, this.onNext, this.onSkip, this.skip, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: MediaQuery.of(context).size.height * 2 / 4,
        padding: kStandardPadding(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: Colors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text!,
              style: kkBoldTextStyle(),
            ),
            Utils.smallHeightBox(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: onSkip,
                  child: Container(
                    height: 40,
                    width: 80,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        skip!,
                        style: kBoldTextStyle(),
                      ),
                    ),
                  ),
                ),
                Utils.mediumWidthBox(context),
                InkWell(
                  onTap: onNext,
                  child: Container(
                    height: 40,
                    width: 80,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        next!,
                        style: kBoldTextStyle(),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}




