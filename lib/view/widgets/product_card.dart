import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX

import '../../model/product_model.dart';
import '../../controller/cart_controller.dart';
import '../screens/cart_page.dart'; // Import cart controller
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find(); // Get the CartController instance

    return Container(
      height: 700,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              product.image,
              fit: BoxFit.contain,
              height: 70,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 10),
          Text(
            product.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: TextStyle(
              color: Colors.green[700],
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Obx(() { // Use Obx to listen to changes in the cart items
                int quantity = cartController.getQuantity(product);
                return Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      '$quantity', // Display the quantity of the product
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                );
              }),

            ],
          ),
          SizedBox(height: 10,),
          Center(
            child: SizedBox(
              height: 27,width: 120,
              child: ElevatedButton(
                onPressed: () {
                  cartController.addToCart(product);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white,fontSize: 10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}