import 'package:flutter/material.dart';
import 'package:spotify_api_project/core/const/color_const/app_colors.dart';
import 'package:spotify_api_project/core/mixin/shimmer_mixin.dart';

class CategoryDetailLoading extends StatelessWidget with ShimmerMixin {
  const CategoryDetailLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: textLine(width: 70, height: 10),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: AppColors.primaryColor,
                    padding: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height * .4,
                    child: Column(
                      children: [
                        Expanded(
                          child: ShimmerLoadig(
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        textLine(width: 70, height: 10),
                        const SizedBox(height: 5),
                        textLine(width: 50, height: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
