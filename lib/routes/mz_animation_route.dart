import 'package:flutter/material.dart';

enum MZAnimationType {
  Fade,
  Scale,
  Rotation,
  SlideToRight,
  SlideToTop,
  SlideToLeft,
  SlideToBottom
}

class MZAnimationRoute extends PageRouteBuilder {
  final Widget page;
  final MZAnimationType type;
  final int duration;
  final Curve curve;

  MZAnimationRoute(
      {@required this.page,
      this.type = MZAnimationType.SlideToLeft,
      this.duration = 500,
      this.curve = Curves.fastOutSlowIn})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                page,
            transitionDuration: Duration(milliseconds: duration),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              switch (type) {
                case MZAnimationType.Fade:
                  return FadeTransition(
                    opacity:
                        Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    )),
                    child: child,
                  );
                case MZAnimationType.Scale:
                  return ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    )),
                    child: child,
                  );
                case MZAnimationType.Rotation:
                  return RotationTransition(
                    turns: Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    )),
                    child: child,
                  );
                default:
                  {
                    Offset begin = Offset(-1.0, 0.0);
                    Offset end = Offset(0.0, 0.0);
                    if (type == MZAnimationType.SlideToTop) {
                      begin = Offset(0.0, 1.0);
                      end = Offset(0.0, 0.0);
                    } else if (type == MZAnimationType.SlideToBottom) {
                      begin = Offset(0.0, -1.0);
                      end = Offset(0.0, 0.0);
                    } else if (type == MZAnimationType.SlideToLeft) {
                      begin = Offset(1.0, 0.0);
                      end = Offset(0.0, 0.0);
                    }
                    return SlideTransition(
                      position:
                          Tween(begin: begin, end: end).animate(CurvedAnimation(
                        parent: animation,
                        curve: curve,
                      )),
                      child: child,
                    );
                  }
              }
            });
}
