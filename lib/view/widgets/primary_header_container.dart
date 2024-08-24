import 'package:flutter/material.dart';

import '../constants/MyColors.dart';
import 'circular_container.dart';
import 'curved_edge_widget.dart';


class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MyCurvedEdgeWidget(
      child: Container(
        color: MyColors.primary,
        padding: EdgeInsets.all(0),
        child: SizedBox(
          child: Stack(
            children: [
              Positioned(top: -130,right: -260, child: CircularContainer(backgroundColor: Colors.white.withOpacity(0.1),height: 400,width: 400,)),
              Positioned(top: 100,right: -280,  child: CircularContainer(backgroundColor: Colors.white.withOpacity(0.1),height: 400,width: 400,)),
              child
            ],
          ),
        ),
      ),
    );
  }
}
