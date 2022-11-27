import 'package:flutter/material.dart';
import 'package:spotify_api_project/core/entity/home_featured_model.dart';
import 'package:spotify_api_project/core/entity/new_releases_model.dart';
import 'package:spotify_api_project/features/home/service/home_service.dart';

class HomeProvider extends ChangeNotifier {
  BuildContext context;

  late HomeService homeService;

  HomeFeaturedModel? homeFeaturedModel;
  NewReleasesModel? newReleasesModel;

  bool isLoading = false;

  setIsLoading(bool b) {
    isLoading = b;
    notifyListeners();
  }

  HomeProvider(this.context) {
    homeService = HomeService();

    getData();
  }


  getData() async {
    await getHomeFeaturedList();
    await getHomeNewReleasesList();
  }

  getHomeFeaturedList() async {
    setIsLoading(true);

    homeFeaturedModel = await homeService.getFeaturedPlaylist();

    setIsLoading(false);
  }

  getHomeNewReleasesList() async {
    setIsLoading(true);

    newReleasesModel = await homeService.getNewReleasesList();

    setIsLoading(false);
  }
}
