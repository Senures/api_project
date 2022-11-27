import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_project/core/const/color_const/app_colors.dart';
import 'package:spotify_api_project/core/mixin/cached_network_ing_mixin.dart';
import 'package:spotify_api_project/features/home/service/home_service.dart';
import 'package:spotify_api_project/features/playlist_detail/view/playlist_detail_view.dart';
import 'package:spotify_api_project/features/search/provider/search_result_provider.dart';
import 'package:spotify_api_project/features/search/view/search_result_loading.dart';

class SearchResultView extends StatelessWidget with CachedNetworkMixin {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchResultProvider>(
      create: (context) => SearchResultProvider(context),
      builder: (context, child) {
        return Consumer<SearchResultProvider>(
          builder: (context, provider, child) {
            return provider.isLoading /* true */
                ? const SearchResultLoading()
                : Scaffold(
                    backgroundColor: AppColors.bgColor,
                    appBar: AppBar(
                      title: const Text("Ara"),
                      centerTitle: true,
                    ),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              cursorColor: Colors.white,
                              style: const TextStyle(
                                  color: AppColors.textPrimaryColor),
                              controller: provider.searchCntrl,
                              decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      List<String> zz = [];

                                      for (var element in SearchTypes.values) {
                                        zz.add(element.name);
                                      }

                                      String searchType = zz.join(",");

                                      provider.searchResult(
                                          searchType: searchType);
                                    },
                                    child: const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                  ),
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
                            !provider.showBody
                                ? const SizedBox()
                                : SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                width: 70,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.grey.shade300,
                                                ),
                                                child: provider
                                                            .searchResultModel
                                                            ?.artist
                                                            ?.items?[0]
                                                            .images
                                                            ?.isEmpty ==
                                                        true
                                                    ? Image.network(
                                                        "https://img.favpng.com/18/10/18/error-download-icon-png-favpng-uePgCTmup4vC6U7vC5cJjc4ie_t.jpg")
                                                    : cachedNetworkManager(
                                                        imgUrl: provider
                                                            .searchResultModel!
                                                            .artist!
                                                            .items![0]
                                                            .images![0]
                                                            .url!),
                                              ),
                                              const SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    provider
                                                            .searchResultModel
                                                            ?.artist
                                                            ?.items?[0]
                                                            .name ??
                                                        "",
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    provider
                                                            .searchResultModel
                                                            ?.artist
                                                            ?.items?[0]
                                                            .type ??
                                                        "",
                                                    style: const TextStyle(
                                                        color: Colors.white54),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Öne Çıkan Oynatma Listeleri",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 30.h,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: provider
                                                .searchResultModel
                                                ?.playlist
                                                ?.items
                                                ?.length,
                                            itemBuilder: (context, index) {
                                              var albumItems = provider
                                                  .searchResultModel
                                                  ?.playlist
                                                  ?.items?[index];

                                              return InkWell(
                                                onTap: () {
                                                  Navigator.push<void>(
                                                    context,
                                                    MaterialPageRoute<void>(
                                                      builder: (BuildContext
                                                              context) =>
                                                          PlaylistDetailView(
                                                              playlistId:
                                                                  albumItems
                                                                      .id!),
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .4,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: cachedNetworkManager(
                                                                imgUrl:
                                                                    albumItems!
                                                                        .images![
                                                                            0]
                                                                        .url!),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        Text(
                                                          albumItems.name ?? "",
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        const SizedBox(
                                                            height: 2),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Öne Çıkan Şarkılar",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                        ListView.builder(
                                          primary: false,
                                          shrinkWrap: true,
                                          itemCount: provider.searchResultModel
                                              ?.track?.items?.length,
                                          itemBuilder: (context, index) {
                                            var trackItem = provider
                                                .searchResultModel
                                                ?.track
                                                ?.items![index];

                                            return ListTile(
                                                leading: SizedBox(
                                                  width: 70,
                                                  height: 70,
                                                  child: cachedNetworkManager(
                                                      imgUrl: trackItem!.album!
                                                          .images![0].url!),
                                                ),
                                                trailing: IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.more_vert,
                                                      color: Colors.white,
                                                    )),
                                                title: Text(
                                                    trackItem.name ?? "",
                                                    style: const TextStyle(
                                                        color: Colors.white)),
                                                subtitle: Text(
                                                    trackItem.artists![0].name!,
                                                    style: const TextStyle(
                                                        color:
                                                            Colors.white54)));
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
          },
        );
      },
    );
  }
}
