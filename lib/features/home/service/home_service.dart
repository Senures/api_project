import 'dart:developer';

import 'package:spotify_api_project/core/const/url_const/url_const.dart';
import 'package:spotify_api_project/core/entity/album_track_model.dart';
import 'package:spotify_api_project/core/entity/albums_model.dart';
import 'package:spotify_api_project/core/entity/category_model.dart';
import 'package:spotify_api_project/core/entity/category_playlist.dart';
import 'package:spotify_api_project/core/entity/featured_playlist.dart';
import 'package:spotify_api_project/core/entity/genres_response.dart';
import 'package:spotify_api_project/core/entity/home_featured_model.dart';
import 'package:spotify_api_project/core/entity/new_releases_model.dart';
import 'package:spotify_api_project/core/entity/playlist_model.dart';
import 'package:spotify_api_project/core/entity/profile_model.dart';
import 'package:spotify_api_project/core/entity/search_result_model.dart';
import 'package:spotify_api_project/core/entity/user_playlist.dart';
import 'package:spotify_api_project/main.dart';

class HomeService {
  Future<HomeFeaturedModel?> getFeaturedPlaylist() async {
    String date = DateTime.now().toUtc().toString();

    var data2 = date.split(" ");

    date = data2[0] + "T" + data2[1];

    var response =
        await dio.get(UrlConst.FEATURED_PLAYLIST.replaceAll(":DATE", date));

    if (response.statusCode == 200) {
      print(response.data);
      return HomeFeaturedModel.fromJson(response.data);
    } else {
      log("FEATURED PLAYLIST ERROR ===  ${response.statusCode}");
    }

    return null;
  }

  Future<NewReleasesModel?> getNewReleasesList() async {
    var response = await dio.get(
      "/browse/new-releases?country=tr&limit=10&offset=1",
    );

    if (response.statusCode == 200) {
      return NewReleasesModel.fromJson(response.data);
    } else {
      log("NEW RELEASES ERROR ===  ${response.statusCode}");
    }

    return null;
  }

  Future<PlaylistModel?> getPlaylistDetail({required playlistId}) async {
    var response = await dio.get("/playlists/$playlistId?market=TR");

    if (response.statusCode == 200) {
      print(response.data);
      return PlaylistModel.fromJson(response.data);
    } else {
      log("PLAYLIST DETAIL ERROR ===  ${response.statusCode}");
    }

    return null;
  }

  Future<CategoryModel?> getCategory() async {
    var response = await dio.get(
      "/browse/categories?country=TR&locale=tr_TR&limit=10&offset=1",
    );

    if (response.statusCode == 200) {
      return CategoryModel.fromJson(response.data);
    } else {
      log("CATEGORY ERROR ===  ${response.statusCode}");
    }

    return null;
  }

  Future<CategoryDetail?> getCategoryPlaylist(
      {required String categoryId}) async {
    var response = await dio.get(
      "/browse/categories/$categoryId/playlists?country=TR&limit=10&offset=1",
    );

    if (response.statusCode == 200) {
      print(response.data);
      return CategoryDetail.fromJson(response.data);
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

  Future<FeaturedPlaylistResponse?> getFeaturedPlaylist2() async {
    var response = await dio.get(
      "/recommendations/available-genre-seeds",
    );

    if (response.statusCode == 200) {
      return FeaturedPlaylistResponse?.fromJson(response.data);
    } else {
      log("FeaturedPlaylistResponse ===  ${response.statusCode}");
    }

    return null;
  }

  Future<SearchResultModel?> getSearchResult(
      {required String searchKey, required String searchType}) async {
    print(searchType);

    var response = await dio.get(
      "/search?q=$searchKey&type=$searchType&market=TR&limit=10",
    );

    log(searchType);

    if (response.statusCode == 200) {
      log(response.data.toString());
      return SearchResultModel?.fromJson(response.data);
    } else {
      log("SEARCH RESULT ERROR ===  ${response.statusCode}");
    }

    return null;
  }

  Future<ProfileModel?> getUserProfile() async {
    var response = await dio.get(
      "/me",
    );

    if (response.statusCode == 200) {
      return ProfileModel?.fromJson(response.data);
    } else {
      log("PROFILE ERROR ===  ${response.statusCode}");
    }

    return null;
  }

  Future<UserPlaylist?> getUserPlaylist({required String userId}) async {
    var response = await dio.get(
      "/users/$userId/playlists?limit=10",
    );

    if (response.statusCode == 200) {
      log(response.data.toString());
      return UserPlaylist?.fromJson(response.data);
    } else {
      log("PROFILE ERROR ===  ${response.statusCode}");
    }

    return null;
  }

  Future<AlbumTrackModel?> getAlbumTracks({required String albumId}) async {
    var response = await dio.get(
      "/albums/$albumId/tracks?market=TR&limit=10",
    );

    if (response.statusCode == 200) {
      log(response.data.toString());
      return AlbumTrackModel?.fromJson(response.data);
    } else {
      log("PROFILE ERROR ===  ${response.statusCode}");
    }

    return null;
  }
}

enum SearchTypes {
  album,
  artist,
  track,
  playlist,
  show,
  episode,
  audiobook,
}
