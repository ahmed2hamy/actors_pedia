import 'package:actors_pedia/constants/constants.dart';
import 'package:actors_pedia/core/widgets/adaptive_image.dart';
import 'package:actors_pedia/features/person_details/presentation/manager/person_details_cubit.dart';
import 'package:actors_pedia/features/person_details/presentation/manager/person_images_cubit/person_images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonDetailsPage extends StatefulWidget {
  const PersonDetailsPage({
    Key? key,
    required this.personId,
  }) : super(key: key);

  final int personId;

  @override
  State<PersonDetailsPage> createState() => _PersonDetailsPageState();
}

class _PersonDetailsPageState extends State<PersonDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<PersonDetailsCubit>().getPersonDetailsEvent(widget.personId);
    context.read<PersonImagesCubit>().getPersonImagesEvent(widget.personId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 0.8 * MediaQuery.of(context).size.width,
              title: const Text("name"),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => Navigator.pop(context),
              ),
              flexibleSpace: const FlexibleSpaceBar(
                background: AdaptiveImage(imageUrl: kDefaultImage),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
