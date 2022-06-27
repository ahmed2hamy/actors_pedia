import 'package:actors_pedia/constants/constants.dart';
import 'package:actors_pedia/core/helpers/app_navigator.dart';
import 'package:actors_pedia/core/widgets/adaptive_image.dart';
import 'package:actors_pedia/features/home/domain/entity/person.dart';
import 'package:actors_pedia/features/person_details/presentation/pages/person_details_page.dart';
import 'package:flutter/material.dart';

class HomeLoadedStateWidget extends StatelessWidget {
  const HomeLoadedStateWidget({
    Key? key,
    required ScrollController scrollController,
    required List<Person> persons,
  })  : _scrollController = scrollController,
        _persons = persons,
        super(key: key);

  final ScrollController _scrollController;
  final List<Person> _persons;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _persons.length,
      itemBuilder: (context, index) {
        if (index == _persons.length - 1) {
          return const Center(child: CircularProgressIndicator());
        }

        String? name = _persons[index].name;
        String? imageUrl = _persons[index].profilePath;
        int? personId = _persons[index].id;

        if (name != null && imageUrl != null && personId != null) {
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
                      onTap: () => AppNavigator.pushTo(
                        context,
                        widget: PersonDetailsPage(person: _persons[index]),
                      ),
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
