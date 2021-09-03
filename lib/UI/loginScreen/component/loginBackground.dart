import 'package:flutter/material.dart';
import 'package:flutter_assignment/Helper/colors.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({Key? key, required this.loginSection})
      : super(key: key);
  final Widget loginSection;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(painter: ShapesPainter(), child: Container()),
        loginSection
      ],
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Colors.white;

    var rect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawRect(rect, paint);

    paint.color = AppColors.Blue;

    var path1 = Path();

    paint.color = AppColors.Blue;
    path1.lineTo(size.width, 0);
    path1.lineTo(size.width, size.height / 2 + 25);
    path1.lineTo(0, size.height / 3);

    path1.close();
    canvas.drawPath(path1, paint);

    var path2 = Path();
    paint.color = AppColors.DarkBlue;
    path2.lineTo(0, size.height - 380);
    path2.lineTo(size.width, size.height / 5.5);
    path2.lineTo(size.width, 0);
    path2.close();
    canvas.drawPath(path2, paint);

    var path3 = Path();
    paint.color = AppColors.Pink;
    path3.lineTo(0, size.height / 5.2);
    path3.lineTo(size.width / 2.5, 0);
    path3.close();
    canvas.drawPath(path3, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
