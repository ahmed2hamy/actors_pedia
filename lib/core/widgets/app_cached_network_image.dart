import 'package:actors_pedia/core/widgets/app_paceholder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String imageUrl;

  const AppCachedNetworkImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const BoxFit fit = BoxFit.fitWidth;

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      placeholder: (context, url) => const AppPlaceholder(fit: fit),
      errorWidget: (context, url, error) => const AppPlaceholder(fit: fit),
    );
  }
}
