
import 'barrel_file.dart';


class SplashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.amber.withOpacity(0.3)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;
    var path = Path();

    path.moveTo(0, size.height * 0.375);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.25, size.width * 0.65, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.65, size.width * 1.0, size.height * 0.60);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class NativeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.quadraticBezierTo(size.width * 0.0, size.height * 0.3742500,
        size.width * 0.0, size.height * 0.4990000);
    path0.cubicTo(
        size.width * 0.3714125,
        size.height * 0.2017600,
        size.width * 0.6229750,
        size.height * 0.8042600,
        size.width,
        size.height * 0.4980000);
    path0.quadraticBezierTo(size.width, size.height * 0.3735000, size.width, 0);
    path0.lineTo(0, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = primaryColor.withOpacity(0.1);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint_0_fill);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = primaryColor.withOpacity(0.1);
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width * 1.002786, size.height), paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(0, 0);
    path_2.lineTo(size.width * 0.8384401, 0);
    path_2.lineTo(size.width * 0.7715543, size.height * 0.04818219);
    path_2.cubicTo(
        size.width * 0.7290975,
        size.height * 0.07876547,
        size.width * 0.6700167,
        size.height * 0.1007458,
        size.width * 0.6032758,
        size.height * 0.1107878);
    path_2.lineTo(size.width * 0.3135070, size.height * 0.1543861);
    path_2.cubicTo(
        size.width * 0.2220409,
        size.height * 0.1681484,
        size.width * 0.1430799,
        size.height * 0.2006281,
        size.width * 0.09218412,
        size.height * 0.2454250);
    path_2.lineTo(0, size.height * 0.3265625);
    path_2.lineTo(0, size.height * 0.2031250);
    path_2.lineTo(0, 0);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = primaryColor.withOpacity(0.5);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 1.000861, size.height * 0.9998359);
    path_3.lineTo(size.width * 0.1624195, size.height * 0.9998359);
    path_3.lineTo(size.width * 0.2293056, size.height * 0.9516531);
    path_3.cubicTo(
        size.width * 0.2717610,
        size.height * 0.9210703,
        size.width * 0.3308412,
        size.height * 0.8990891,
        size.width * 0.3975850,
        size.height * 0.8890469);
    path_3.lineTo(size.width * 0.6873510, size.height * 0.8454484);
    path_3.cubicTo(
        size.width * 0.7788189,
        size.height * 0.8316875,
        size.width * 0.8577799,
        size.height * 0.7992078,
        size.width * 0.9086741,
        size.height * 0.7544109);
    path_3.lineTo(size.width * 1.000861, size.height * 0.6732734);
    path_3.lineTo(size.width * 1.000861, size.height * 0.7967109);
    path_3.lineTo(size.width * 1.000861, size.height * 0.9998359);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;

    paint_3_fill.color =  primaryColor.withOpacity(0.5);
    canvas.drawPath(path_3, paint_3_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class greyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.transparent;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint_0_fill);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.transparent;
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width * 1.002786, size.height), paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(0, 0);
    path_2.lineTo(size.width * 0.8384401, 0);
    path_2.lineTo(size.width * 0.7715543, size.height * 0.04818219);
    path_2.cubicTo(
        size.width * 0.7290975,
        size.height * 0.07876547,
        size.width * 0.6700167,
        size.height * 0.1007458,
        size.width * 0.6032758,
        size.height * 0.1107878);
    path_2.lineTo(size.width * 0.3135070, size.height * 0.1543861);
    path_2.cubicTo(
        size.width * 0.2220409,
        size.height * 0.1681484,
        size.width * 0.1430799,
        size.height * 0.2006281,
        size.width * 0.09218412,
        size.height * 0.2454250);
    path_2.lineTo(0, size.height * 0.3265625);
    path_2.lineTo(0, size.height * 0.2031250);
    path_2.lineTo(0, 0);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Colors.teal.withOpacity(0.7);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 1.000861, size.height * 0.9998359);
    path_3.lineTo(size.width * 0.1624195, size.height * 0.9998359);
    path_3.lineTo(size.width * 0.2293056, size.height * 0.9516531);
    path_3.cubicTo(
        size.width * 0.2717610,
        size.height * 0.9210703,
        size.width * 0.3308412,
        size.height * 0.8990891,
        size.width * 0.3975850,
        size.height * 0.8890469);
    path_3.lineTo(size.width * 0.6873510, size.height * 0.8454484);
    path_3.cubicTo(
        size.width * 0.7788189,
        size.height * 0.8316875,
        size.width * 0.8577799,
        size.height * 0.7992078,
        size.width * 0.9086741,
        size.height * 0.7544109);
    path_3.lineTo(size.width * 1.000861, size.height * 0.6732734);
    path_3.lineTo(size.width * 1.000861, size.height * 0.7967109);
    path_3.lineTo(size.width * 1.000861, size.height * 0.9998359);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;

    paint_3_fill.color = Colors.teal.withOpacity(0.7);
    canvas.drawPath(path_3, paint_3_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}