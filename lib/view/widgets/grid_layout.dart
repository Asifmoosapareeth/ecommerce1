import 'package:flutter/material.dart';

class ItemGridLayout extends StatelessWidget {
  const ItemGridLayout({super.key,
  required this.itemBuilder,
    required this.itemCount,
    this.mainAxisExtent=288,
      this.crossAxisCount=2,
  });

  final int itemCount ;
  final int crossAxisCount ;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          mainAxisExtent: mainAxisExtent,
        ),
        itemBuilder: itemBuilder,
    );
  }
}
