import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

class AppImageDownloader {
  const AppImageDownloader._();

  static Future<void> download({
    required String url,
    required void Function() onDownloadCompleted,
  }) async {
    try {
      String? imageId = await ImageDownloader.downloadImage(url);
      if (imageId != null) {
        onDownloadCompleted();
      }
    } on PlatformException catch (error) {
      log("AppImageDownloader: $error");
    }
  }
}
