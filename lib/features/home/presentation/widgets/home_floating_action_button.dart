import 'package:actors_pedia/features/home/presentation/manger/home_scroll_to_top_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScrollToTopProvider>(
      builder: (context, provider, child) {
        return Visibility(
          visible: provider.showFAB,
          child: FloatingActionButton(
            onPressed: onPressed,
            child: const Icon(Icons.keyboard_arrow_up),
          ),
        );
      },
    );
  }
}
