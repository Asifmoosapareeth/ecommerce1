import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.width ,
    this.height,
    this.radius = 400,
    this.padding ,
    this.child,
    this.backgroundColor = Colors.white,
    this.margin,
     this.showBorder = false,
     this.borderColor = Colors.grey,
  });
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: showBorder? Border.all(color: borderColor): null,
          color: backgroundColor
      ),
      child: child,
    );
  }
}
