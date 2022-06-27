import 'package:actors_pedia/constants/constants.dart';
import 'package:actors_pedia/core/helpers/dialogs.dart';
import 'package:actors_pedia/core/widgets/adaptive_image.dart';
import 'package:actors_pedia/core/widgets/app_loading_widget.dart';
import 'package:actors_pedia/features/home/domain/entity/person.dart';
import 'package:actors_pedia/features/person_details/domain/entities/person_details.dart';
import 'package:actors_pedia/features/person_details/presentation/manager/person_details_cubit.dart';
import 'package:actors_pedia/features/person_details/presentation/manager/person_images_cubit/person_images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonDetailsPage extends StatefulWidget {
  const PersonDetailsPage({
    Key? key,
    required this.person,
  }) : super(key: key);

  final Person person;

  @override
  State<PersonDetailsPage> createState() => _PersonDetailsPageState();
}

class _PersonDetailsPageState extends State<PersonDetailsPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _getPersonDetails();
  }

  void _getPersonDetails() {
    int? id = widget.person.id;
    if (id != null) {
      context.read<PersonDetailsCubit>().getPersonDetailsEvent(id);
      context.read<PersonImagesCubit>().getPersonImagesEvent(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 0.8 * MediaQuery.of(context).size.width,
              title: Text(widget.person.name ?? ''),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => Navigator.pop(context),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: AdaptiveImage(
                    imageUrl:
                        kImagesBaseUrl + (widget.person.profilePath ?? '')),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const PersonDetailsWidget(),
                  PersonImagesWidget(scrollController: _scrollController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}

class PersonDetailsWidget extends StatelessWidget {
  const PersonDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonDetailsCubit, PersonDetailsState>(
      listener: (context, state) {
        if (state is PersonDetailsErrorState) {
          Dialogs.showAppSnackBar(context, content: state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is PersonDetailsLoadingState) {
          return const AppLoadingWidget();
        } else if (state is PersonDetailsLoadedState) {
          PersonDetails details = state.personDetails;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsField(details.knownForDepartment),
              DetailsField(details.placeOfBirth),
              DetailsField(details.birthday),
              DetailsField(details.biography),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class DetailsField extends StatelessWidget {
  const DetailsField(
    this.detail, {
    Key? key,
  }) : super(key: key);

  final String? detail;

  @override
  Widget build(BuildContext context) {
    if (detail != null) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 15.0,
        ),
        child: Text(detail!),
      );
    } else {
      return const SizedBox();
    }
  }
}

class PersonImagesWidget extends StatelessWidget {
  const PersonImagesWidget({Key? key, required this.scrollController})
      : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonImagesCubit, PersonImagesState>(
      listener: (context, state) {
        if (state is PersonImagesErrorState) {
          Dialogs.showAppSnackBar(context, content: state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is PersonImagesLoadingState) {
          return const AppLoadingWidget();
        } else if (state is PersonImagesLoadedState) {
          return GridView.builder(
            controller: scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            shrinkWrap: true,
            itemCount: state.personImages.profiles?.length,
            itemBuilder: (context, index) {
              String? path = state.personImages.profiles?[index].filePath;
              return path != null
                  ? Card(
                      margin: const EdgeInsets.all(8.0),
                      child: AdaptiveImage(
                        imageUrl: kImagesBaseUrl + path,
                      ),
                    )
                  : const SizedBox();
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
