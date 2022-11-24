import 'package:flutter/cupertino.dart';
import 'package:spotify_api_project/core/entity/category_playlist.dart';
import 'package:spotify_api_project/features/home/service/home_service.dart';

class CategoryPlaylistProvider with ChangeNotifier {
  BuildContext context;

  CategoryPlaylist? categoryPlaylist;
  late HomeService homeService;
  bool isLoading = false;

  String categoryId;

  CategoryPlaylistProvider(this.context, this.categoryId) {
    homeService = HomeService();
    getCategoryPlaylist(categoryId: categoryId);
  }

  setIsLoading(bool b) {
    isLoading = b;
    notifyListeners();
  }

  getCategoryPlaylist({required String categoryId}) async {
    setIsLoading(true);
    categoryPlaylist =
        await homeService.getCategoryPlaylist(categoryId: categoryId);

    setIsLoading(false);
  }
}
