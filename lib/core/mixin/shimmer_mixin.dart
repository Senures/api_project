import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

mixin ShimmerMixin {
  Widget textLine({double? width, double? height}) {
    return ShimmerLoadig(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class ShimmerLoadig extends StatelessWidget {
  final Widget child;
  const ShimmerLoadig({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey,
      child: child,
    );
  }
}
