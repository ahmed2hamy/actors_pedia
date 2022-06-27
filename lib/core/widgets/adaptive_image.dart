import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AdaptiveImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;

  const AdaptiveImage({
    Key? key,
    required this.imageUrl,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AdaptiveImageProvider(imageUrl),
      fit: fit,
    );
  }
}

class AdaptiveImageProvider extends ImageProvider {
  AdaptiveImageProvider(String imageUrl) : _delegate = _resolve(imageUrl);
  final ImageProvider _delegate;

  static ImageProvider _resolve(String url) {
    final uri = Uri.parse(url);
    switch (uri.scheme) {
      case 'asset':
        final path = uri.toString().replaceFirst('asset://', '');
        return AssetImage(path);
      case 'file':
        final file = File.fromUri(uri);
        return FileImage(file);
      case 'http':
      case 'https':
        return CachedNetworkImageProvider(url);
      default:
        throw ArgumentError('Unsupported scheme: ${uri.scheme}');
    }
  }

  @override
  ImageStreamCompleter load(Object key, DecoderCallback decode) =>
      _delegate.load(key, decode);

  @override
  Future<Object> obtainKey(ImageConfiguration configuration) =>
      _delegate.obtainKey(configuration);
}
