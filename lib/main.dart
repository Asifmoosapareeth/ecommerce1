import 'package:ecommerce_app/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'controller/cart_controller.dart';

void main() async{
  Get.put(CartController());
  await _initHive();
  runApp(const MyApp());
}
Future<void> _initHive() async{
  await Hive.initFlutter();
  await Hive.openBox("login");
  await Hive.openBox("accounts");
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,

    );
  }
}
