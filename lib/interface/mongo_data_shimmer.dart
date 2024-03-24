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
    final screenSize = MediaQuery.sizeOf(context);
    return Shimmer.fromColors(
      baseColor: qgrey.withOpacity(0.4),
      highlightColor: qyellow,
      direction: ShimmerDirection.ltr,
      period: const Duration(seconds: 2),
      child: Column(
        children: [],
      ),
    );
  }
}
