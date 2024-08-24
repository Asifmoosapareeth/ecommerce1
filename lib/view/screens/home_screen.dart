// lib/view/home_screen.dart

import 'package:ecommerce_app/view/screens/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/view/widgets/custom_appbar.dart';
import 'package:ecommerce_app/view/widgets/grid_layout.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import '../../model/product_model.dart';
import '../../service/product_service.dart';
import '../constants/image_string.dart';
import '../widgets/cart_counter.dart';
import '../widgets/my_searchbar.dart';
import '../widgets/primary_header_container.dart';
import '../widgets/product_card.dart';
import '../widgets/promo_slider.dart';
import 'cart_page.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final Box _boxLogin = Hive.box("login");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  CustomAppBar(
                    title: Text(
                      _boxLogin.get("userName"),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: Colors.white),
                    ),
                    actions: [
                      CartCounterIcon(
                        iconColor: Colors.white,
                        onPressed: () {
                          Get.to(CartPage());
                          },
                      )
                    ],
                  ),
                  SizedBox(height: 32.0),
                  MySearchContainer(),
                  SizedBox(height: 32.0),
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Column(
                      children: [
                        SizedBox(height: 14),
                        SizedBox(height: 32)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 5),
              child: Column(
                children: [
                  PromoSlider(
                    banners: [
                      MyImages.promoBanner1,
                      MyImages.promoBanner2,
                      MyImages.promoBanner3
                    ],
                  ),
                  SizedBox(height: 14),
                  _buildProductGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return FutureBuilder<List<Product>>(
      future: ProductService().fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Failed to load products: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No products available'));
        } else {
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.7,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final product = snapshot.data![index];
              return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductDetailsPage(product: product,)),
                    );
                  },
                  child: ProductCard(product: product));

            },
          );
        }
      },
    );
  }
}
