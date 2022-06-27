import 'package:flutter/foundation.dart';

class HomeScrollToTopProvider extends ChangeNotifier {
  bool _showFAB = true;

  bool get showFAB => _showFAB;

  void showBackToTopButton() {
    _showFAB = true;
    notifyListeners();
  }

  void hideBackToTopButton() {
    _showFAB = false;
    notifyListeners();
  }
}
