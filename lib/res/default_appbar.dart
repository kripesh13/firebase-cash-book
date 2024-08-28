import 'barrel_file.dart';

AppBar defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) {
  title ??= ""; // Default to empty string if title is null
  return AppBar(
    elevation: 0,
    leadingWidth: 70,
    leading: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center(
        child: InkWell(
          onTap: () {
            Navigator.maybePop(
                context); // Ensure context is not null before using it
          },
          child: Container(
            width: 35.0,
            height: 35.0,
            decoration: BoxDecoration(
              color: whiteColor,
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: primaryColor),
            ),
            child: Icon(
              Icons.arrow_back,
              color: primaryColor,
              size: 25.0,
            ),
          ),
        ),
      ),
    ),
    actions: actions ?? [], // Default to empty list if actions is null
    title: Text(
      title,
      style: kkBoldTextStyle().copyWith(fontSize: 16),
    ),
  );
}
