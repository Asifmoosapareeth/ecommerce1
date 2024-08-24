
import 'package:ecommerce_app/view/screens/checkout_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/cart_controller.dart';
import '../../model/product_model.dart';
class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({ key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 16),
            Text(
              product.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              product.description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.price}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 30,height: 30,
                  child: Center(
                    child: IconButton.filled(
                      hoverColor: Colors.blue,
                      focusColor: Colors.blue,
                      onPressed: () {

                        cartController.addToCart(product);
                      },
                      icon: Center(child: Icon(CupertinoIcons.plus,size: 10,)),
                    ),
                  ),
                ),
                Obx(() {
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
                        '$quantity',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  );
                }),
                SizedBox(
                  width: 30,height: 30,
                  child: Center(
                    child: IconButton.filled(
                      hoverColor: Colors.blue,
                      focusColor: Colors.blue,
                      onPressed: () {
                        cartController.removeFromCart(product);
                      },
                      icon: Center(child: Icon(CupertinoIcons.minus,size: 10,)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              Get.to(PaymentPage());
            },
                child: Text('But Now'))
          ],
        ),
      ),

    );
  }
}