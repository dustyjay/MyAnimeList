import '../utils/constants.dart';
import 'package:flutter/material.dart';

class CustomIcon {
  static double _getIconSize([size]) {
    double iconSize = 24.0;
    int increment = 0;
    if (size == Constants.iconSizeLarge) {
      increment = 8;
    } else if (size == Constants.iconSizeSmall) {
      increment = -8;
    }
    return iconSize + increment;
  }

  static Icon favIcon(BuildContext context, bool isActive, [size]) {
    return Icon(
      isActive ? Icons.favorite : Icons.favorite_border,
      color: Colors.red,
      semanticLabel: isActive ? 'Remove from saved' : 'Save',
      size: _getIconSize(size),
    );
  }

  // static IconButton favIconButton(BuildContext context, bool isActive, [size]) {
  //   return IconButton(

  //     icon: isActive ? Icons.favorite : Icons.favorite_border,
  //     onPressed: ,
  //     color: Colors.red,
  //     semanticLabel: isActive ? 'Remove from saved' : 'Save',
  //     size: _getIconSize(size),
  //   );
  // }
}
