// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:quanta/constants/theme.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingAnimation extends StatefulWidget {
  const ShimmerLoadingAnimation({super.key});

  @override
  _ShimmerLoadingAnimationState createState() =>
      _ShimmerLoadingAnimationState();
}

class _ShimmerLoadingAnimationState extends State<ShimmerLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: qgrey.withOpacity(0.4),
      highlightColor: qyellow,
      direction: ShimmerDirection.ltr,
      period: const Duration(seconds: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return FadeTransition(
                opacity: _animation,
                child: child,
              );
            },
            child: Container(
              height: screenSize.height * 0.02,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: qgrey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(height: 8),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return FadeTransition(
                opacity: _animation,
                child: child,
              );
            },
            child: Container(
              height: screenSize.height * 0.02,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: qgrey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(height: 8),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return FadeTransition(
                opacity: _animation,
                child: child,
              );
            },
            child: Container(
              height: screenSize.height * 0.02,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: qgrey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(height: 8),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return FadeTransition(
                opacity: _animation,
                child: child,
              );
            },
            child: Container(
              height: screenSize.height * 0.02,
              width: screenSize.width * 0.8,
              decoration: BoxDecoration(
                color: qgrey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
