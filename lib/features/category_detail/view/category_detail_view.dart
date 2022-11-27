import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_project/core/const/color_const/app_colors.dart';
import 'package:spotify_api_project/core/mixin/cached_network_ing_mixin.dart';
import 'package:spotify_api_project/features/category_detail/provider/category_detail_provider.dart';
import 'package:spotify_api_project/features/category_detail/view/category_detail_loading.dart';
import 'package:spotify_api_project/features/playlist_detail/view/playlist_detail_view.dart';

class CategoryDetailView extends StatelessWidget with CachedNetworkMixin {
  final String categoryId;
  final String categorName;

  const CategoryDetailView(
      {super.key, required this.categorName, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryDetailProvider>(
      create: (context) => CategoryDetailProvider(context, categoryId),
      builder: (context, child) {
        return Consumer<CategoryDetailProvider>(
          builder: (context, provider, child) {
            return provider.isLoading
                ? const CategoryDetailLoading()
                : Scaffold(
                    backgroundColor: AppColors.bgColor,
                    appBar: AppBar(
                      title: Text(categorName),
                      centerTitle: true,
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          GridView.builder(
                            primary: false,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            shrinkWrap: true,
                            itemCount: provider
                                .categoryDetail?.playlists?.items?.length,
                            itemBuilder: (context, index) {
                              var categoryItem = provider
                                  .categoryDetail?.playlists?.items?[index];

                              return InkWell(
                                onTap: () {
                                  Navigator.push<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          PlaylistDetailView(
                                              playlistId: categoryItem.id!),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: AppColors.primaryColor,
                                    padding: const EdgeInsets.all(8),
                                    height:
                                        MediaQuery.of(context).size.height * .4,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: cachedNetworkManager(
                                                imgUrl: categoryItem!
                                                    .images![0].url!),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          categoryItem.name ?? "",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          categoryItem.owner?.displayName ?? "",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
