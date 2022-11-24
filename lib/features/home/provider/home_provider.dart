import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spotify_api_project/core/entity/albums_model.dart';
import 'package:spotify_api_project/core/entity/category_model.dart';
import 'package:spotify_api_project/core/entity/category_playlist.dart';
import 'package:spotify_api_project/core/entity/genres_response.dart';
import 'package:spotify_api_project/features/home/service/home_service.dart';

class HomeProvider extends ChangeNotifier {
  BuildContext context;

  late HomeService homeService;

  CategoryModel? categoryModel;
  AlbumsResponse? albumsResponse;
  GenresResponse? genresReponse;

  List<Items>? categoryList;

  bool isLoading = false;

  setIsLoading(bool b) {
    isLoading = b;
    notifyListeners();
  }

  HomeProvider(this.context) {
    homeService = HomeService();

    getCategoryList();
    //getAlbumsList();
    getGenres();
  }

  getCategoryList() async {
    setIsLoading(true);
    categoryModel = await homeService.getCategory();

    if (categoryModel != null) {
      categoryList = categoryModel!.categories!.items;
    }

    setIsLoading(false);
  }

  getAlbumsList() async {
    setIsLoading(true);
    albumsResponse = await homeService.getAlbums();
  }

  getGenres() async {
    setIsLoading(true);
    genresReponse = await homeService.getGenres();
    setIsLoading(false);
  }
}
