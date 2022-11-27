import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_project/core/const/color_const/app_colors.dart';
import 'package:spotify_api_project/core/const/images/app_images.dart';
import 'package:spotify_api_project/core/mixin/shimmer_mixin.dart';

class PlaylistDetailLoading extends StatelessWidget with ShimmerMixin {
  const PlaylistDetailLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202C28),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
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
                    SizedBox(
                      //color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      height: 39.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 5,
                            child: ShimmerLoadig(
                              child: Container(
                                height: 15.h,
                                width: 50.w,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textLine(width: 100, height: 20),
                                textLine(width: 70, height: 20),
                              ],
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      textLine(height: 10, width: 25),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      textLine(height: 10, width: 50),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 0, top: 8),
                                    child: textLine(height: 10, width: 150),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 40.w,
                                  height: 6.h,
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 15),
                                      textLine(width: 25, height: 25),
                                      const SizedBox(width: 15),
                                      textLine(width: 25, height: 25),
                                      const SizedBox(width: 15),
                                      textLine(width: 25, height: 25),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 40.w,
                                  height: 6.h,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      textLine(width: 25, height: 25),
                                      textLine(width: 25, height: 25),
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

            ///
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SizedBox(
                      child: textLine(width: 70, height: 70),
                    ),
                    trailing: textLine(width: 20, height: 40),
                    title: textLine(width: 80, height: 10),
                    subtitle: textLine(width: 50, height: 10),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
