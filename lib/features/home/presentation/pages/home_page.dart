import 'package:actors_pedia/constants/constants.dart';
import 'package:actors_pedia/core/widgets/custom_app_bar.dart';
import 'package:actors_pedia/features/home/domain/entity/person.dart';
import 'package:actors_pedia/features/home/presentation/manger/home_cubit.dart';
import 'package:actors_pedia/features/home/presentation/manger/home_scroll_to_top_provider.dart';
import 'package:actors_pedia/features/home/presentation/widgets/home_body_widget.dart';
import 'package:actors_pedia/features/home/presentation/widgets/home_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final List<Person> _persons = [];
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListenerEvents);
  }

  void _scrollListenerEvents() {
    _getMorePeople();

    _manipulateBackToTopButton();
  }

  void _getMorePeople() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _page = ++_page;
        context.read<HomeCubit>().getMorePeopleEvent(_page);
      }
    });
  }

  void _manipulateBackToTopButton() {
    if (_scrollController.offset >= 400) {
      Provider.of<HomeScrollToTopProvider>(
        context,
        listen: false,
      ).showBackToTopButton();
    } else {
      Provider.of<HomeScrollToTopProvider>(
        context,
        listen: false,
      ).hideBackToTopButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(
        context: context,
        title: kAppTitleString,
      ),
      body: HomeBodyWidget(
        scrollController: _scrollController,
        persons: _persons,
      ),
      floatingActionButton: HomeFloatingActionButton(onPressed: _scrollToTop),
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(seconds: 2),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
