import 'package:flutter/material.dart';

import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key, this.width , this.hieght, required this.imageUrl, this.border,  this.applyIMageRadius= true, this.backgroundColor=TColors.light, this.fit=BoxFit.contain, this.padding, this.isNetworkImage=false, this.onPressed,  this.borderRadius=TSizes.md,
  });

  final double? width, hieght;
  final String imageUrl;
  final BoxBorder? border;
  final bool applyIMageRadius;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: hieght,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyIMageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
            fit: fit,
          ),
        ),
      ),
    );
  }
}