import 'package:flutter/cupertino.dart';

enum Direction { LEFT_TO_RIGHT, RIGHT_TO_LEFT }

class ShakeTransaction extends StatelessWidget {
  ShakeTransaction(
      {@required this.child,
      this.direction = Direction.RIGHT_TO_LEFT,
      this.axis = Axis.horizontal,
      this.offset = 140.0,
      this.duration = const Duration(milliseconds: 1500)});

  final Widget child;
  final double offset;
  final Duration duration;
  final Axis axis;
  final Direction direction;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: direction == Direction.LEFT_TO_RIGHT
          ? Tween(begin: -1, end: 0)
          : Tween(begin: 1, end: 0),
      duration: duration,
      child: child,
      curve: Curves.elasticInOut,
      builder: (context, value, child) => Transform.translate(
        offset: axis == Axis.horizontal
            ? Offset(value * 500, 0.0)
            : Offset(0.0, value * 200),
        child: child,
      ),
    );
  }
}
