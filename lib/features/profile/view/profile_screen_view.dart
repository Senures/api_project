import 'package:cached_network_image/cached_network_image.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_project/core/const/app_string/app_strings.dart';
import 'package:spotify_api_project/core/const/color_const/app_colors.dart';
import 'package:spotify_api_project/core/mixin/cached_network_ing_mixin.dart';
import 'package:spotify_api_project/core/mixin/shimmer_mixin.dart';
import 'package:spotify_api_project/features/playlist_detail/view/playlist_detail_view.dart';
import 'package:spotify_api_project/features/profile/provider/profile_provider.dart';
import 'package:spotify_api_project/features/profile/view/profile_loading.dart';

class ProfileScreenView extends StatelessWidget
    with ShimmerMixin, CachedNetworkMixin {
  const ProfileScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileProvider>(
      create: (context) => ProfileProvider(context),
      builder: (context, child) {
        return Consumer<ProfileProvider>(
          builder: (context, provider, child) {
            return provider.isLoading
                ? const ProfileLoading()
                : DraggableHome(
                    appBarColor: const Color(0xff432724),
                    backgroundColor: const Color(0xff432724),
                    stretchMaxHeight: 0.9,
                    headerExpandedHeight: 0.4,
                    title: const Text(AppStrings.textProfile),
                    headerWidget: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xffA25A53), Color(0xff432724)])),
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              AppStrings.textProfile,
                              style: TextStyle(
                                  color: AppColors.textPrimaryColor,
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              width: 130.px,
                              height: 130.px,
                              decoration: const BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              child: cachedNetworkManager(
                                  fit: BoxFit.cover,
                                  imgUrl:
                                      provider.profileModel!.images![0].url!),
                            ),
                            Column(
                              children: [
                                Text(
                                  provider.profileModel!.email!,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  provider.profileModel!.displayName!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 1.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        provider.profileModel!.followers!.total
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        "Takipçi",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        6.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        "Takip edilen",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    body: [
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: provider.userPlaylist?.items?.length,
                          primary: false,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            var userPlaylistItem =
                                provider.userPlaylist?.items?[index];

                            return InkWell(
                              onTap: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        PlaylistDetailView(
                                            playlistId: userPlaylistItem.id!),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        height: 10.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.all(10.0),
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 70, 56, 55),
                                        ),
                                        child:
                                            userPlaylistItem?.images?.isEmpty ==
                                                    true
                                                ? const Icon(Icons.error,
                                                    color: Colors.white)
                                                : cachedNetworkManager(
                                                    fit: BoxFit.cover,
                                                    imgUrl: userPlaylistItem!
                                                        .images![0].url!)),
                                  ),
                                  Text(
                                    userPlaylistItem!.name!,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ]);
          },
        );
      },
    );
  }
}
