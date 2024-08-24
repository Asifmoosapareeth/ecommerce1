import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  CustomAppBar({
    super.key,
    this.title,
    this.showBackArrow=false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  @override
  Widget build(BuildContext context) {
   return Padding(
       padding: EdgeInsets.symmetric(horizontal: 16),
   child: AppBar(
     automaticallyImplyLeading: false,
     leading: showBackArrow
         ? IconButton(onPressed: ()=> Get.back(), icon: Icon(Iconsax.arrow_left))
         : leadingIcon !=null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)): null,
   title: title,
     actions: actions,
   backgroundColor: Colors.transparent,

   ),
   );
  }

  @override
  
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
}