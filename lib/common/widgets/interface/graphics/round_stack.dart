import 'package:flutter/material.dart';

class RoundStackWidget extends StatelessWidget {
  const RoundStackWidget({
    super.key,
    this.height,
    this.width,
    required this.borderColor,
    required this.radius,
    required this.padding,
    this.bgColor,
    this.child,
  });

  final double? height;
  final double? width;
  final double radius;
  final double padding;
  final Color? bgColor;
  final Widget? child;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          width: 1.5,
          color: borderColor,
        ),
      ),
      child: child,
    );
  }
}
