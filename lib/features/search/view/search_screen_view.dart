import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_project/core/const/color_const/app_colors.dart';
import 'package:spotify_api_project/core/mixin/cached_network_ing_mixin.dart';
import 'package:spotify_api_project/features/category_detail/view/category_detail_view.dart';
import 'package:spotify_api_project/features/search/provider/search_provider.dart';
import 'package:spotify_api_project/features/search/view/search_loading.dart';
import 'package:spotify_api_project/features/search/view/search_result_view.dart';

import '../../playlist_detail/view/playlist_detail_view.dart';

class SearchView extends StatelessWidget with CachedNetworkMixin {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchProvider>(
      create: (context) => SearchProvider(context),
      builder: (context, child) {
        return Consumer<SearchProvider>(
          builder: (context, provider, child) {
            return provider.isLoading
                ? const SearchLoading()
                : Scaffold(
                    backgroundColor: AppColors.bgColor,
                    appBar: AppBar(
                      title: const Text("Ara"),
                    ),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              onTap: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const SearchResultView(),
                                  ),
                                );
                              },
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
                                  hintStyle: const TextStyle(
                                      color: AppColors.textPrimaryColor)),
                            ),
                            const SizedBox(height: 10),
                            const Text("Tüm Kategoriler",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            const SizedBox(height: 10),
                            GridView.builder(
                              primary: false,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 1.7),
                              itemCount: provider
                                  .categoryModel?.categories?.items?.length,
                              itemBuilder: (context, index) {
                                var categoryItem = provider
                                    .categoryModel?.categories?.items![index];

                                return InkWell(
                                  onTap: () {
                                    Navigator.push<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            CategoryDetailView(
                                                categoryId: categoryItem.id!,
                                                categorName:
                                                    categoryItem.name!),
                                      ),
                                    );
                                  },
                                  child: Container(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      margin: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            right: -10,
                                            bottom: 0,
                                            child: Transform.rotate(
                                              angle: 3.14 / 12.0,
                                              child: Card(
                                                elevation: 10,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                margin: EdgeInsets.zero,
                                                child: SizedBox(
                                                  width: 20.w,
                                                  height: 20.w,
                                                  child: cachedNetworkManager(
                                                    imgUrl: categoryItem!
                                                        .icons![0].url!,
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
                                                width: (MediaQuery.of(context)
                                                            .size
                                                            .width -
                                                        ((MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                .5) -
                                                            40)) /
                                                    2,
                                                child: Text(
                                                  categoryItem.name!,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
