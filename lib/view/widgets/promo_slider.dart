
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/view/widgets/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../constants/MyColors.dart';
import 'circular_container.dart';


class PromoSlider extends StatelessWidget {
   PromoSlider({
    super.key, required this.banners,
  });
final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            items: banners.map((url) => RoundedImage(imageUrl: url)).toList(),

            options: CarouselOptions(
              onPageChanged: (index,_) => controller.updatePageIndiacator(index),
              viewportFraction: 1,
              autoPlay: true,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
            )),
        SizedBox(height: 16,),

        Center(
          child: Obx(
              ()=> Row(
                mainAxisSize: MainAxisSize.min,
              children: [
                for(int i=0; i<3; i++)
                  CircularContainer(height: 4,width: 20,
                    backgroundColor: controller.carousalCurrentIndex.value==i ? MyColors.primary: Colors.grey,
                    margin: EdgeInsets.only(right: 10),),
              ],
            ),
          ),
        )
      ],
    );
  }
}

