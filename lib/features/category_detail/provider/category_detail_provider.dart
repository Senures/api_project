import 'package:flutter/cupertino.dart';
import 'package:spotify_api_project/core/entity/category_playlist.dart';
import 'package:spotify_api_project/features/home/service/home_service.dart';

class CategoryDetailProvider with ChangeNotifier {
  BuildContext context;

  CategoryDetail? categoryDetail;
  late HomeService homeService;
  bool isLoading = false;

  String categoryId;

  CategoryDetailProvider(this.context, this.categoryId) {
    homeService = HomeService();
    getCategoryDetail(categoryId: categoryId);
  }

  setIsLoading(bool b) {
    isLoading = b;
    notifyListeners();
  }

  getCategoryDetail({required String categoryId}) async {
    setIsLoading(true);
    categoryDetail =
        await homeService.getCategoryPlaylist(categoryId: categoryId);

    setIsLoading(false);
  }
}
