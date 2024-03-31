import 'package:flutter/material.dart';
import 'package:quanta/constants/theme.dart';
import 'package:shimmer/shimmer.dart';

class MongoDataShimmer extends StatefulWidget {
  const MongoDataShimmer({super.key});

  @override
  State<MongoDataShimmer> createState() => _MongoDataShimmerState();
}

class _MongoDataShimmerState extends State<MongoDataShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animations = List.generate(
      2,
      (index) => Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            0.25 * index,
            0.25 * (index + 1),
            curve: Curves.easeInOut,
          ),
        ),
      ),
    );

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Shimmer.fromColors(
      baseColor: qgrey.withOpacity(0.4),
      highlightColor: qgrey.withOpacity(0.6),
      direction: ShimmerDirection.ltr,
      period: const Duration(seconds: 2), // Keep overall shimmer duration
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          2,
          (index) => AnimatedBuilder(
            animation: _animations[index],
            builder: (context, child) {
              return FadeTransition(
                opacity: _animations[index],
                child: child,
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenSize.height * 0.2,
                      width: screenSize.width * 0.95,
                      decoration: BoxDecoration(
                        color: qgrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    ThemeClass.space1,
                    Container(
                      height: screenSize.height * 0.02,
                      width: screenSize.width * 0.85,
                      decoration: BoxDecoration(
                        color: qgrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    ThemeClass.space0,
                    Container(
                      height: screenSize.height * 0.02,
                      width: screenSize.width * 0.5,
                      decoration: BoxDecoration(
                        color: qgrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
