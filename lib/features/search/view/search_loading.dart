import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_project/core/const/color_const/app_colors.dart';
import 'package:spotify_api_project/core/mixin/shimmer_mixin.dart';

class SearchLoading extends StatelessWidget with ShimmerMixin {
  const SearchLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: textLine(width: 70, height: 10),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ShimmerLoadig(
                child: TextFormField(
                  readOnly: true,
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
              const SizedBox(height: 10),
              textLine(width: 150, height: 20),
              const SizedBox(height: 10),
              GridView.builder(
                primary: false,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.7),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Stack(
                        children: [
                          Positioned(
                            right: -10,
                            bottom: 0,
                            child: Transform.rotate(
                              angle: 3.14 / 12.0,
                              child: ShimmerLoadig(
                                child: Card(
                                  elevation: 10,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  margin: EdgeInsets.zero,
                                  child: SizedBox(
                                    width: 20.w,
                                    height: 20.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                  width: (MediaQuery.of(context).size.width -
                                          ((MediaQuery.of(context).size.width *
                                                  .5) -
                                              40)) /
                                      2,
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: textLine(width: 70, height: 10))),
                            ),
                          ),
                        ],
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
