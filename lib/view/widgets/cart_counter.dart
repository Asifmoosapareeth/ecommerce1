import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:iconsax/iconsax.dart';
import '../../controller/cart_controller.dart';


class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    this.iconColor = Colors.white,
    required this.onPressed,
  });

  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.shopping_bag, color: iconColor),
        ),
        Positioned(
          top: 1,
          right: 5,
          child: Obx(() {
            return Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  '${cartController.totalQuantity}',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
