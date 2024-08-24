import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MySearchContainer extends StatelessWidget {
  const MySearchContainer({
    super.key,
    this.ontap,
    this.padding = const EdgeInsets.symmetric (horizontal: 24)

  });
  final EdgeInsetsGeometry padding;
final VoidCallback? ontap;
  @override
  Widget build (BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding (
          padding: padding,
       child: Container (
       width: MediaQuery.of(context).size.width,
       padding: const EdgeInsets.all(16),
       decoration: BoxDecoration(
      color: Colors.white,
       borderRadius: BorderRadius.circular (16),
          border: Border.all(color: Colors.grey)
      ), // BoxDecoration
        child: Row(
      children: [
       const Icon(Iconsax.search_normal, color: Colors.black45),
       const SizedBox (width: 16),
       Text('Search in Store', style: Theme.of(context).textTheme.bodySmall),
  ],
      ),
      ),
      ),
    );// Container ); // Padding
  }
}