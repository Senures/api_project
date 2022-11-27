import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_project/core/const/app_string/app_strings.dart';
import 'package:spotify_api_project/core/const/color_const/app_colors.dart';
import 'package:spotify_api_project/core/mixin/shimmer_mixin.dart';

class ProfileLoading extends StatelessWidget with ShimmerMixin {
  const ProfileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff432724),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                    textLine(width: 100, height: 20),
                    SizedBox(height: 20),
                    ShimmerLoadig(
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: 130.px,
                        height: 130.px,
                        decoration: const BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        textLine(width: 150, height: 10),
                        SizedBox(
                          height: 2.h,
                        ),
                        textLine(width: 100, height: 10),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              textLine(width: 20, height: 10),
                              SizedBox(height: 10),
                              textLine(width: 100, height: 10),
                            ],
                          ),
                          Column(
                            children: [
                              textLine(width: 20, height: 10),
                              SizedBox(height: 10),
                              textLine(width: 100, height: 10),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            ////////////////
            GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 4,
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      child: ShimmerLoadig(
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          height: 10.h,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 70, 56, 55),
                          ),
                        ),
                      ),
                    ),
                    textLine(width: 100, height: 10),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
