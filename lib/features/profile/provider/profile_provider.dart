import 'package:flutter/cupertino.dart';
import 'package:spotify_api_project/core/entity/profile_model.dart';
import 'package:spotify_api_project/core/entity/user_playlist.dart';
import 'package:spotify_api_project/features/home/service/home_service.dart';

class ProfileProvider extends ChangeNotifier {
  BuildContext context;

  bool isLoading = false;
  late HomeService homeService;
  ProfileModel? profileModel;
  UserPlaylist? userPlaylist;

  ProfileProvider(this.context) {
    homeService = HomeService();
    getData();
  }

  getData() async {
    await getProfile();
    await getUserPlaylist();
  }

  setIsLoading(bool b) {
    isLoading = b;
    notifyListeners();
  }

  getProfile() async {
    setIsLoading(true);
    profileModel = await homeService.getUserProfile();
    // setIsLoading(false);
  }

  getUserPlaylist() async {
    // setIsLoading(true);

    userPlaylist =
        await homeService.getUserPlaylist(userId: profileModel!.displayName!);

    setIsLoading(false);
  }
}
