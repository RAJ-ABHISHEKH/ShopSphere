import 'dart:typed_data';

import 'package:android_d/common/widgets/images/t_circular_images.dart';
import 'package:flutter/material.dart';


import '../../../../../../common/widgets/icons/t_circular_icon.dart';

import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/sizes.dart';
import 't_rounded_image.dart';

/// Widget for uploading images with optional editing functionality
class TImageUploader extends StatelessWidget {
  const TImageUploader({
    Key? key,
    this.image,
    this.onIconButtonPressed,
    this.memoryImage,
    this.width = 100,
    this.height = 100,
    // required this.imageType,
    this.circular = false,
    this.icon = Icons.create,
    this.top,
    this.bottom = 0,
    this.right,
    this.left = 0,
  }) : super(key: key);

  /// Whether to display the image in a circular shape
  final bool circular;

  /// URL or path of the image to display
  final String? image;

  /// Type of image (network, asset, memory, etc.)
  // final ImageType imageType;

  /// Width of the image uploader widget
  final double width;

  /// Height of the image uploader widget
  final double height;

  /// Byte data of the image (for memory images)
  final Uint8List? memoryImage;

  /// Icon to display on the image uploader widget
  final IconData icon;

  /// Offset from the top edge of the widget
  final double? top;

  /// Offset from the bottom edge of the widget
  final double? bottom;

  /// Offset from the right edge of the widget
  final double? right;

  /// Offset from the left edge of the widget
  final double? left;

  /// Callback function for when the icon button is pressed
  final void Function()? onIconButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Display the image in either circular or rounded shape
        // circular
        //     ? TCircularImage(
        //   image: image,
        //   width: width,
        //   height: height,
        //   imageType: imageType,
        //   memoryImage: memoryImage,
        //   backgroundColor: TColors.primaryBackground,
        // )
        //     : TRoundedImage(
        //   image: image,
        //   width: width,
        //   height: height,
        //   imageType: imageType,
        //   memoryImage: memoryImage,
        //   backgroundColor: TColors.primaryBackground,
        // ),
        // Display the edit icon button on top of the image
        Positioned(
          top: top,
          left: left,
          right: right,
          bottom: bottom,
          child: TCircularIcon(
            icon: icon,
            size: TSizes.md,
            color: Colors.white,
            onPressed: onIconButtonPressed,
            backgroundColor: TColors.primary.withOpacity(0.9),
          ),
        )
      ],
    );
  }
}