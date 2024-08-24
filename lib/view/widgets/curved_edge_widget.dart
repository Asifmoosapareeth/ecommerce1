import 'package:flutter/material.dart';
import 'custom_curve.dart';
class MyCurvedEdgeWidget extends StatelessWidget {
  const MyCurvedEdgeWidget({
    super.key, this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child:child,
    );
  }
}
