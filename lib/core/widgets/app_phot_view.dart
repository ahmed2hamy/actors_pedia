import 'package:actors_pedia/constants/constants.dart';
import 'package:actors_pedia/core/helpers/app_image_downloader.dart';
import 'package:actors_pedia/core/helpers/dialogs.dart';
import 'package:actors_pedia/core/widgets/adaptive_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class AppPhotoView extends StatelessWidget {
  const AppPhotoView({
    Key? key,
    required this.url,
    this.tag,
  }) : super(key: key);

  final String url;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
            onPressed: () {
              AppImageDownloader.download(
                  url: url,
                  onDownloadCompleted: () {
                    Dialogs.showAppSnackBar(
                      context,
                      content: kImageDownloadedString,
                    );
                  });
            },
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      body: PhotoView(
        imageProvider: AdaptiveImageProvider(url),
        loadingBuilder: (context, progress) => Center(
          child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: progress == null
                  ? null
                  : progress.cumulativeBytesLoaded /
                      (progress.expectedTotalBytes ?? 0),
            ),
          ),
        ),
        backgroundDecoration: const BoxDecoration(color: Colors.black),
        gaplessPlayback: false,
        customSize: MediaQuery.of(context).size,
        heroAttributes: PhotoViewHeroAttributes(
          tag: tag ?? '',
          transitionOnUserGestures: true,
        ),
        enableRotation: false,
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered,
        initialScale: PhotoViewComputedScale.contained,
        basePosition: Alignment.center,
      ),
    );
  }
}
