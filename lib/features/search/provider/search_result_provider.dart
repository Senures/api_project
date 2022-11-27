import 'package:flutter/cupertino.dart';
import 'package:spotify_api_project/core/entity/search_result_model.dart';
import 'package:spotify_api_project/features/home/service/home_service.dart';

class SearchResultProvider extends ChangeNotifier {
  BuildContext context;

  late HomeService homeService;

  var searchCntrl = TextEditingController();

  bool isLoading = false;

  SearchResultModel? searchResultModel;
  bool showBody = false;

  SearchResultProvider(this.context) {
    homeService = HomeService();
  }

  setIsLoading(bool b) {
    isLoading = b;
    notifyListeners();
  }

  setShowBody(bool b) {
    showBody = b;
    notifyListeners();
  }

  searchResult({required String searchType}) async {
    setIsLoading(true);
    setShowBody(false);

    searchResultModel = null;

    searchResultModel = await homeService.getSearchResult(
        searchKey: searchCntrl.text, searchType: searchType);

    print(searchResultModel?.toJson());
    setShowBody(true);
    setIsLoading(false);
  }
}
