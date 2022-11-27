import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_project/core/const/color_const/app_colors.dart';
import 'package:spotify_api_project/core/const/images/app_images.dart';
import 'package:spotify_api_project/core/mixin/cached_network_ing_mixin.dart';
import 'package:spotify_api_project/features/playlist_detail/provider/playlist_detail_provider.dart';
import 'package:spotify_api_project/features/playlist_detail/view/now_play.dart';
import 'package:spotify_api_project/features/playlist_detail/view/playlist_detail_loading.dart';

class PlaylistDetailView extends StatelessWidget with CachedNetworkMixin {
  final String playlistId;

  const PlaylistDetailView({super.key, required this.playlistId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlaylistDetailProvider>(
      create: (context) => PlaylistDetailProvider(context, playlistId),
      builder: (context, child) {
        return Consumer<PlaylistDetailProvider>(
          builder: (context, provider, child) {
            return provider.isLoading
                ? const PlaylistDetailLoading()
                : DraggableHome(
                    stretchMaxHeight: 0.9,
                    appBarColor: const Color(0xff202C28),
                    backgroundColor: const Color(0xff202C28),
                    headerExpandedHeight: 0.4,
                    title: Text(provider.playlistModel!.name!),
                    headerWidget: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xff4F826F), Color(0xff202C28)])),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //color: Colors.red,
                              width: MediaQuery.of(context).size.width,
                              height: 39.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      height: 25.h,
                                      child: cachedNetworkManager(
                                          imgUrl: provider
                                              .playlistModel!.images![0].url!),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${provider.playlistModel!.owner!.displayName!} :",
                                            style: const TextStyle(
                                                color:
                                                    AppColors.textPrimaryColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            provider.playlistModel!.name!,
                                            style: const TextStyle(
                                                color:
                                                    AppColors.textPrimaryColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 4.w,
                                      ),
                                      //  color: Colors.amber,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          /*  const Text(
                                            AppStrings.description,
                                            style: TextStyle(
                                                color: AppColors
                                                    .textSecondaryColor),
                                          ), */
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                AppImages.logo,
                                                width: 25.0,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              const Text(
                                                "Spotify",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors
                                                        .textPrimaryColor),
                                              )
                                            ],
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 5, top: 8),
                                            child: Text(
                                              "Kasım 25,2022",
                                              style: TextStyle(
                                                  color: AppColors
                                                      .textSecondaryColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 40.w,
                                          height: 6.h,
                                          //color: Colors.blue,
                                          child: Image.asset(
                                            AppImages.group,
                                          ),
                                        ),
                                        Container(
                                          width: 40.w,
                                          height: 6.h,
                                          //color: Colors.blue,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.asset(
                                                AppImages.shuffle,
                                                width: 23.0,
                                              ),
                                              Image.asset(
                                                AppImages.play,
                                                width: 32.0,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    /* , */
                    body: [
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount:
                              provider.playlistModel?.tracks?.items?.length,
                          itemBuilder: (context, index) {
                            var trackItems =
                                provider.playlistModel?.tracks?.items![index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        NowPlaying(trackItems: trackItems),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: cachedNetworkManager(
                                      imgUrl: trackItems!
                                          .track!.album!.images![0].url!),
                                ),
                                trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                    )),
                                title: Text(
                                  trackItems.track!.album!.name!,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  trackItems.track!.album!.artists![0].name!,
                                  style: const TextStyle(color: Colors.white54),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
          },
        );
      },
    );
  }
}
