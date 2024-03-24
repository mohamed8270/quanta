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
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    // Create separate animations for each container
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500), // Adjust duration as needed
    );
    _animations = List.generate(
        4,
        (index) => Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Interval(
                  0.25 * index, // Start each animation with 25% delay
                  0.25 * (index + 1),
                  curve: Curves.easeInOut,
                ),
              ),
            ));

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
      period: const Duration(seconds: 2), // Keep overall shimmer duration
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          4,
          (index) => AnimatedBuilder(
            animation: _animations[index],
            builder: (context, child) {
              return FadeTransition(
                opacity: _animations[index],
                child: child,
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                height: screenSize.height * 0.02,
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: qgrey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
