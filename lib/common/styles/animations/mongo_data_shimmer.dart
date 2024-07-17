import 'package:flutter/material.dart';
import 'package:quanta/common/styles/static.dart';
import 'package:quanta/common/styles/theme.dart';
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
      1,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          1,
          (index) => AnimatedBuilder(
            animation: _animations[index],
            builder: (context, child) {
              return FadeTransition(
                opacity: _animations[index],
                child: child,
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: screenSize.height * 0.15,
                    width: screenSize.width * 0.35,
                    decoration: BoxDecoration(
                      color: qgrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  StaticClass.gap1,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: screenSize.height * 0.02,
                        width: screenSize.width * 0.53,
                        decoration: BoxDecoration(
                          color: qgrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      StaticClass.gap1,
                      Container(
                        height: screenSize.height * 0.02,
                        width: screenSize.width * 0.5,
                        decoration: BoxDecoration(
                          color: qgrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      StaticClass.gap1,
                      Container(
                        height: screenSize.height * 0.02,
                        width: screenSize.width * 0.3,
                        decoration: BoxDecoration(
                          color: qgrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
