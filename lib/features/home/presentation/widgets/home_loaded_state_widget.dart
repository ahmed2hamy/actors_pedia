import 'package:actors_pedia/constants/constants.dart';
import 'package:actors_pedia/core/widgets/adaptive_image.dart';
import 'package:actors_pedia/features/home/domain/entity/person.dart';
import 'package:flutter/material.dart';

class HomeLoadedStateWidget extends StatelessWidget {
  const HomeLoadedStateWidget({
    Key? key,
    required ScrollController scrollController,
    required List<Person> results,
  })  : _scrollController = scrollController,
        _results = results,
        super(key: key);

  final ScrollController _scrollController;
  final List<Person> _results;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _results.length,
      itemBuilder: (context, index) {
        if (index == _results.length - 1) {
          return const Center(child: CircularProgressIndicator());
        }

        String? name = _results[index].name;
        String? imageUrl = _results[index].profilePath;

        if (name != null && imageUrl != null) {
          return Card(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                AdaptiveImage(imageUrl: kImagesBaseUrl + imageUrl),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 28.0),
                  margin: const EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AdaptiveImageProvider(kTitleBGImage),
                      alignment: Alignment.center,
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Text(
                    name,
                    style: kBlackMediumTextStyle,
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
