//
// import 'package:ecommerce_app/view/screens/product_details.dart';
// import 'package:ecommerce_app/view/widgets/rounded_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
//
// import '../constants/MyColors.dart';
// import '../constants/image_string.dart';
// import 'circular_container.dart';
//
//
// class VerticalProductCard  extends StatelessWidget {
//   const VerticalProductCard ({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: ()=> Get.to(
//
//           const ProductDetails()
//       ),
//       child: Container(
//         width: 180,
//         padding: EdgeInsets.all(1),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: Colors.white
//         ),
//         child: Column(
//           children: [
//            CircularContainer(
//              height: 170,
//              radius: 10,
//              margin: EdgeInsets.all(8),
//              backgroundColor: MyColors.light,
//              child: Stack(
//                children: [
//                  RoundedImage(imageUrl: MyImages.productImage1,applyImageRadius: true, ),
//
//                  Positioned(
//                    top: 10,
//                    child: CircularContainer(
//                      height: 20,width: 35,
//                      radius: 8 ,
//                      backgroundColor: MyColors.secondary.withOpacity(0.8),
//                      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
//                      child: Center(child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black),)),
//
//                    ),
//                  ),
//               Positioned(
//                   top: 0,right: 0,
//                   child:IconButton(onPressed: (){}, icon:Icon(Iconsax.heart5,color: Colors.red,) )
//
//               )
//                ],
//              ),
//            ),
//             SizedBox(height: 7),
//
//             Padding(padding: EdgeInsets.only(left: 8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//               Text(
//               'Green Nike Air Shoes',
//               style:  Theme.of(context).textTheme.labelLarge ,
//               overflow: TextOverflow.ellipsis,
//             ),
//
//                 SizedBox(height:7),
//                //BrandTitleWithVerifyIcon(title: 'Nike',iconSize: MySizes.md,)
//               ],
//             ),
//             ),
//             Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15),
//                   child: Text('\$35.5',
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: MyColors.dark,
//                     borderRadius: BorderRadius.circular(120),
//                   ),
//                   child: SizedBox(
//                     width: 24 ,
//                     height: 24 ,
//                     child: Icon(Iconsax.add,color: Colors.white,),
//                   ),
//                 )
//               ],
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
