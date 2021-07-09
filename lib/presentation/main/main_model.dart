import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  int _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;
  set currentTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }
}
