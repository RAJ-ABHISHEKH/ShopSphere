import 'package:flutter/material.dart';

import '../../../../utlis/constants/colors.dart';
class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,this.margin, this.width=400, this.height=400, this.radius=400, this.child, this.backgroundColor=TColors.white,  this.padding=0,
  });
  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color:backgroundColor,
      ),
      child: child,
    );
  }
}