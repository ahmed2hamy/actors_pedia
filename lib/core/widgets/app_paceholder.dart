import 'package:actors_pedia/constants/constants.dart';
import 'package:actors_pedia/core/widgets/adaptive_image.dart';
import 'package:flutter/material.dart';

class AppPlaceholder extends StatelessWidget {
  final BoxFit? fit;

  const AppPlaceholder({Key? key, this.fit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveImage(
      image: kDefaultImage,
      fit: fit,
    );
  }
}
