import 'package:flutter/cupertino.dart';
import 'package:spotify_api_project/core/entity/album_track_model.dart';
import 'package:spotify_api_project/features/home/service/home_service.dart';

class AlbumDetailProvider extends ChangeNotifier {
  BuildContext context;

  late HomeService homeService;

  bool isLoading = false;
  String? albumId;

  AlbumTrackModel? albumTrackModel;

  setIsLoading(bool b) {
    isLoading = b;
    notifyListeners();
  }

  AlbumDetailProvider(this.context, this.albumId) {
    homeService = HomeService();

    getAlbumTracks();
  }

  getAlbumTracks() async {
    setIsLoading(true);

    albumTrackModel = await homeService.getAlbumTracks(albumId: albumId!);

    setIsLoading(false);
  }
}
