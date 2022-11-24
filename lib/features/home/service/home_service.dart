import 'dart:convert';
import 'dart:developer';

import 'package:spotify_api_project/core/entity/albums_model.dart';
import 'package:spotify_api_project/core/entity/category_model.dart';
import 'package:spotify_api_project/core/entity/category_playlist.dart';
import 'package:spotify_api_project/core/entity/genres_response.dart';
import 'package:spotify_api_project/main.dart';

class HomeService {
  Future<CategoryModel?> getCategory() async {
    var response = await dio.get(
      "/browse/categories?country=US&locale=us_US&limit=10&offset=5",
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

  Future<AlbumsResponse?> getAlbums() async {
    var response = await dio.get(
      "/albums?ids=382ObEPsp2rxGrnsizN5TX%2C1A2GTWGtFfWp7KSQTwWOyo%2C2noRn2Aes5aoNVsU6iWThc&market=US",
    );

    if (response.statusCode == 200) {
      print(response.data);
      return AlbumsResponse?.fromJson(response.data);
    } else {
      log("ALBUMS ERROR ===  ${response.statusCode}");
    }

    return null;
  }

  Future<GenresResponse?> getGenres() async {
    var response = await dio.get(
      "/recommendations/available-genre-seeds",
    );

    if (response.statusCode == 200) {
      return GenresResponse?.fromJson(response.data);
    } else {
      log("GenresReponseERROR ===  ${response.statusCode}");
    }

    return null;
  }
}
