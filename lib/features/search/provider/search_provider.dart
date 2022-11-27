import 'package:flutter/cupertino.dart';
import 'package:spotify_api_project/core/entity/category_model.dart';
import 'package:spotify_api_project/features/home/service/home_service.dart';

class SearchProvider extends ChangeNotifier {
  BuildContext context;

  late HomeService homeService;
  CategoryModel? categoryModel;

  bool isLoading = false;

  SearchProvider(this.context) {
    homeService = HomeService();

    getCategoryList();
  }

  setIsLoading(bool b) {
    isLoading = b;
    notifyListeners();
  }

  getCategoryList() async {
    setIsLoading(true);
    categoryModel = await homeService.getCategory();
    setIsLoading(false);
  }
}
