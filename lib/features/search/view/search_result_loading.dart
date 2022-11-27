import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_project/core/mixin/shimmer_mixin.dart';

import '../../../core/const/color_const/app_colors.dart';

class SearchResultLoading extends StatelessWidget with ShimmerMixin {
  const SearchResultLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: textLine(width: 70, height: 10),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ShimmerLoadig(
                child: TextFormField(
                  cursorColor: Colors.white,
                  style: const TextStyle(color: AppColors.textPrimaryColor),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.primaryColor,
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Ne dinlemek istiyorsun?",
                      hintStyle:
                          const TextStyle(color: AppColors.textPrimaryColor)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ShimmerLoadig(
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textLine(width: 70, height: 10),
                              const SizedBox(height: 10),
                              textLine(width: 50, height: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: textLine(width: 170, height: 20),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 30.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * .4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: ShimmerLoadig(
                                      child: Container(
                                        width: 180,
                                        height: 150,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  textLine(width: 50, height: 10),
                                  const SizedBox(height: 2),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: textLine(width: 170, height: 20),
                    ),
                    ListView.builder(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
