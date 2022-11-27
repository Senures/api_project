import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_project/core/const/app_string/app_strings.dart';
import 'package:spotify_api_project/core/const/color_const/app_colors.dart';
import 'package:spotify_api_project/core/const/images/app_images.dart';
import 'package:spotify_api_project/core/mixin/cached_network_ing_mixin.dart';
import 'package:spotify_api_project/features/albums_detail/view/albums_detail_view.dart';
import 'package:spotify_api_project/features/home/provider/home_provider.dart';
import 'package:spotify_api_project/features/home/view/home_screen_loading.dart';
import 'package:spotify_api_project/features/playlist_detail/view/playlist_detail_view.dart';

class HomeScreenView extends StatelessWidget with CachedNetworkMixin {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(context),
      builder: (context, widget) {
        return Consumer<HomeProvider>(
          builder: (context, provider, widget) {
            return provider.isLoading
                ? const HomeScreenLoading()
                : Scaffold(
                    backgroundColor: AppColors.bgColor,
                    appBar: homeAppBar(provider),
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customTitle(
                            AppStrings.homeTitle1,
                          ),
                          homeListOne(provider),
                          customTitle(AppStrings.homeTitle2),
                          homeListTwo(provider),
                        ],
                      ),
                    ),
                  );
          },
        );
      },
    );
  }

  homeAppBar(HomeProvider provider) {
    return AppBar(
      elevation: 0.0,
      centerTitle: false,
      title: Text(
        provider.homeFeaturedModel?.message ?? '',
        style: const TextStyle(fontSize: 25.0),
      ),
      actions: [
        Image.asset(AppImages.icon1),
        Image.asset(AppImages.icon2),
        Image.asset(AppImages.icon3)
      ],
    );
  }

  customTitle(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 2.h),
      child: Text(
        text,
        style: const TextStyle(
            color: AppColors.textPrimaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 20),
      ),
    );
  }

  homeListOne(HomeProvider provider) {
    return SizedBox(
      // color: Colors.red,
      //width: 200,
      height: 35.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: provider.homeFeaturedModel?.playlists?.items?.length,
        itemBuilder: (context, index) {
          var featuredItem =
              provider.homeFeaturedModel?.playlists?.items?[index];

          return InkWell(
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      PlaylistDetailView(playlistId: featuredItem.id!),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.primaryColor),
                height: 15.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: cachedNetworkManager(
                            imgUrl: featuredItem!.images![0].url!),
                      ),
                    ),

                    Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 3.w, top: 1.h),
                          // color: Colors.amber,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  featuredItem.name ?? "",
                                  style: const TextStyle(
                                    color: AppColors.textPrimaryColor,
                                    fontSize: 19.0,
                                    letterSpacing: .5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  featuredItem.owner?.displayName ?? "",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.0,
                                    color: AppColors.textSecondaryColor,
                                  ),
                                ),
                              ]),
                        ))
                    // Text(featuredItem.description ?? ""),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  homeListTwo(HomeProvider provider) {
    return SizedBox(
      height: 35.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: provider.newReleasesModel?.albums?.items?.length,
        itemBuilder: (context, index) {
          var featuredItem = provider.newReleasesModel?.albums?.items?[index];

          return InkWell(
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => AlbumsDetailView(
                      id: featuredItem.id!, featuredItem: featuredItem),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.primaryColor),
                height: 15.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Image.network(featuredItem!.images![0].url!),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 3.w, top: 1.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                featuredItem.name ?? "",
                                style: const TextStyle(
                                  color: AppColors.textPrimaryColor,
                                  fontSize: 19.0,
                                  letterSpacing: .5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                featuredItem.artists?[0].name ?? "",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.0,
                                  color: AppColors.textSecondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ))
                    // Text(featuredItem.description ?? ""),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
