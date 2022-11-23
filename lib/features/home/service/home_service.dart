import 'dart:developer';

import 'package:spotify_api_project/core/entity/category_model.dart';
import 'package:spotify_api_project/core/entity/category_playlist.dart';
import 'package:spotify_api_project/main.dart';

class HomeService {
  Future<CategoryModel?> getCategory() async {
    var response = await dio.get(
      "/browse/categories?country=TR&locale=tr_TR&limit=10&offset=5",
    );

    if (response.statusCode == 200) {
      print(response.data);
      return CategoryModel.fromJson(response.data);
    } else {
      log("CATEGORY ERROR ===  ${response.statusCode}");
    }

    return null;
  }

  Future<CategoryPlaylist?> getCategoryPlaylist(
      {required String categoryId}) async {
    var response = await dio.get(
      "/browse/categories/$categoryId/playlists?country=TR&limit=10&offset=5",
    );

    if (response.statusCode == 200) {
      print(response.data);
      return CategoryPlaylist.fromJson(response.data);
    } else {
      log("CATEGORY PLAYLIST ERROR ===  ${response.statusCode}");
    }

    return null;
  }
}
