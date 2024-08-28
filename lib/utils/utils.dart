import 'package:flutter/foundation.dart';
import '../res/barrel_file.dart';

class Utils {
  // Focus field utility
  static fieldFocusNode(
      BuildContext context, FocusNode nextFocus, FocusNode currentFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // Validation utility for email
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegex.hasMatch(email);
  }

  // Show toast message
  static void showToast(String message,
      {ToastPosition position = ToastPosition.bottom}) {
    showToastWidget(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
          color: Colors.black87,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      position: position,
      duration: const Duration(seconds: 3),
    );
  }

  // Replace the current screen with a new one using a widget
  static void replaceWith(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  // Navigate to a new screen using a named route
  static void navigateToNamed(BuildContext context, String routeName,
      {Object? arguments}) {
    Navigator.pushNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }

  // Replace the current screen with a new one using a named route
  static void replaceWithNamed(BuildContext context, String routeName,
      {Object? arguments}) {
    Navigator.pushReplacementNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }

  // Format text (capitalize first letter of each word)
  static String capitalizeEachWord(String text) {
    return text
        .split(' ')
        .map((word) => word.isNotEmpty
            ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
            : '')
        .join(' ');
  }

  // Show loading dialog
  static void showLoadingDialog(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomLoadingIndicator(),
                const SizedBox(width: 16.0),
                Text(message ?? 'Loading...'),
              ],
            ),
          ),
        );
      },
    );
  }

  // Dismiss loading dialog
  static void dismissLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }

  // General Snackbar

  static void showSnackbar(BuildContext context, String message,
      {Color? backgroundColor, Duration? duration}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor ?? Colors.black,
      duration: duration ?? Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Success Snackbar
  static void showSuccessSnackbar(BuildContext context, String message) {
    showSnackbar(
      context,
      message,
      backgroundColor: Colors.green,
    );
  }

  // Error Snackbar
  static void showErrorSnackbar(BuildContext context, String message) {
    showSnackbar(
      context,
      message,
      backgroundColor: Colors.red,
    );
  }

  // Warning Snackbar
  static void showWarningSnackbar(BuildContext context, String message) {
    showSnackbar(
      context,
      message,
      backgroundColor: Colors.orange,
    );
  }

  // Info Snackbar
  static void showInfoSnackbar(BuildContext context, String message) {
    showSnackbar(
      context,
      message,
      backgroundColor: Colors.blue,
    );
  }

  static SizedBox smallHeightBox(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.01, // 1% of screen height
    );
  }

  // Medium height SizedBox
  static SizedBox mediumHeightBox(BuildContext context) {
    return SizedBox(
      height:
          MediaQuery.of(context).size.height * 0.015, // 1.5% of screen height
    );
  }

  // Large height SizedBox
  static SizedBox largeHeightBox(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02, // 2% of screen height
    );
  }

  // Extra Small height SizedBox
  static SizedBox extraSmallHeightBox(BuildContext context) {
    return SizedBox(
      height:
          MediaQuery.of(context).size.height * 0.005, // 0.5% of screen height
    );
  }

  // Small width SizedBox
  static SizedBox smallWidthBox(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.01, // 1% of screen width
    );
  }

  // Medium width SizedBox
  static SizedBox mediumWidthBox(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.02, // 2% of screen width
    );
  }

  // Large width SizedBox
  static SizedBox largeWidthBox(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.04, // 4% of screen width
    );
  }

  static String stripHtmlIfNeeded(String text) {
    return text.replaceAll(
      RegExp(r'<[^>]*>|&[^;]+;'),
      ' ',
    );
  }

  static String maskPhoneNumber(String phoneNumber) {
    if (phoneNumber.length < 10) return phoneNumber; // simple validation

    return '***-***-*${phoneNumber.substring(phoneNumber.length - 3)}';
  }

  String formatNumber(int number) {
    return number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match match) => '${match[1]},',
        );
  }
}

class DebugPrinter {
  static void printDebug(String message) {
    if (kDebugMode) {
      print('[DEBUG] $message');
    }
  }
}
