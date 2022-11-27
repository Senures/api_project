import 'package:flutter/cupertino.dart';
import 'package:spotify_api_project/features/profile/view/profile_screen_view.dart';
import 'package:spotify_api_project/features/search/view/search_screen_view.dart';

import '../../home/view/home_screen_view.dart';

class BaseProvider extends ChangeNotifier {
  final BuildContext context;

  int currentIndex = 0;

  BaseProvider(this.context);

  setCurrentIndex(int i) {
    currentIndex = i;
    notifyListeners();
  }

  Widget getBody() {
    switch (currentIndex) {
      case 0:
        return const HomeScreenView();
      case 1:
        return const SearchView();
      case 2:
        return const ProfileScreenView();

      default:
        return const HomeScreenView();
    }
  }
}
