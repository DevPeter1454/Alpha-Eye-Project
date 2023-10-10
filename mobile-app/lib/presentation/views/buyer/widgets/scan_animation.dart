import 'package:flutter/material.dart';

class ScanningAnimation extends StatefulWidget {
  @override
  _ScanningAnimationState createState() => _ScanningAnimationState();
}

class _ScanningAnimationState extends State<ScanningAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.linear,
      ),
    );

    _controller!.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.green,
              Colors.green,
              Colors.transparent,
              Colors.transparent,
            ],
            stops: [
              0.0,
              0.1,
              0.5,
              0.9,
              1.0,
              1.0,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter, // Change to top to bottom gradient
          ),
        ),
        child: AnimatedBuilder(
          animation: _controller!,
          builder: (context, child) {
            return CustomPaint(
              painter: LinePainter(_animation!.value),
            );
          },
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final double position;

  LinePainter(this.position);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.green
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    final double startX = size.width / 2;
    final double startY =
        size.height * (1 - position); // Adjust position vertically

    canvas.drawLine(
      Offset(startX, startY),
      Offset(startX, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
