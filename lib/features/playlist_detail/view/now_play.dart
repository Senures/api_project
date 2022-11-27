import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_project/core/const/color_const/app_colors.dart';
import 'package:spotify_api_project/core/entity/playlist_model.dart';
import 'package:spotify_api_project/core/mixin/cached_network_ing_mixin.dart';

class NowPlaying extends StatelessWidget with CachedNetworkMixin {
  final Items? trackItems;
  const NowPlaying({super.key, required this.trackItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: const Text("Now Playing"),
        centerTitle: true,
        actions: const [Icon(Icons.more_vert_outlined)],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: 88.w,
              height: 44.h,
              child: cachedNetworkManager(
                  imgUrl: trackItems!.track!.album!.images![0].url!),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            Container(
              height: 8.h,
              // color: Colors.red,
              margin: EdgeInsets.symmetric(vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 7.h,
                    // color: Colors.amber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          trackItems!.track!.album!.name!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                              color: Colors.white),
                        ),
                        Text(
                          trackItems!.track!.album!.artists![0].name!,
                          style: const TextStyle(color: Colors.white54),
                        ),
                      ],
                    ),
                  ),
                  Image.asset("assets/fav.png"),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Slider(
                        activeColor: Colors.white,
                        value: 2.20,
                        min: 0.0,
                        max: 3.20,
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "2.20",
                      style: const TextStyle(color: Colors.white54),
                    ),
                    Text(
                      "4:20",
                      style: const TextStyle(color: Colors.white54),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 90.w,
              height: 15.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.replay,
                    color: Colors.white,
                  ),
                  const Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.skip_next,
                    color: Colors.white,
                  ),
                  const Icon(
                    Icons.shuffle,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Column(
              children: const [
                Icon(Icons.keyboard_arrow_up_outlined, color: Colors.white),
                Text(
                  "lyrics",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
