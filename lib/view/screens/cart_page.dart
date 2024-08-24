// lib/view/cart_page.dart

import 'package:ecommerce_app/view/screens/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find(); // Get CartController instance

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Obx(() { // Use Obx to reactively update the UI
        if (cartController.items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart, size: 100, color: Colors.grey),
                Text('Your cart is empty.', style: TextStyle(fontSize: 20, color: Colors.grey)),
              ],
            ),
          );
        }
        return ListView.builder(
          itemCount: cartController.items.length,
          itemBuilder: (context, index) {
            final product = cartController.items[index];
            return Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Image.network(product.image, width: 50, height: 50),
                title: Text(product.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: Obx(() {
                  return Text('\$${product.price.toStringAsFixed(2)} x ${cartController.getQuantity(product)}', style: TextStyle(fontSize: 16, color: Colors.grey));
                }),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove, color: Colors.red),
                      onPressed: () {
                        cartController.removeFromCart(product);
                      },
                    ),
                    Obx(() {
                      return Text('${cartController.getQuantity(product)}', style: TextStyle(fontSize: 16));
                    }),
                  ],
                ),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              return Text(
                'Total: \$${cartController.totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            }),
            ElevatedButton(
              onPressed: () {
                Get.to(PaymentPage());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Checkout', style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}