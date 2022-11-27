import 'package:flutter/cupertino.dart';
import 'package:spotify_api_project/core/entity/category_playlist.dart';
import 'package:spotify_api_project/features/home/service/home_service.dart';

import '../../../core/entity/playlist_model.dart';

class PlaylistDetailProvider extends ChangeNotifier {
  BuildContext context;
  String playlistId;
  bool isLoading = false;
  late HomeService homeService;

  PlaylistModel? playlistModel;
  List<PlaylistModel> playList = [];

  PlaylistDetailProvider(this.context, this.playlistId) {
    homeService = HomeService();

    getPlayListDetail();
  }

  setIsLoading(bool b) {
    isLoading = b;
    notifyListeners();
  }

  getPlayListDetail() async {
    setIsLoading(true);

    playlistModel = await homeService.getPlaylistDetail(playlistId: playlistId);

    setIsLoading(false);
  }
}
