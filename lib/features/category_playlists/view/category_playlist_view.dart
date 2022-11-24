import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_project/features/category_playlists/provider/category_playlist_provider.dart';

class CategoryPlaylistView extends StatelessWidget {
  final String categoryId;
  const CategoryPlaylistView({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryPlaylistProvider>(
      create: (context) => CategoryPlaylistProvider(context, categoryId),
      builder: (context, child) {
        return Consumer<CategoryPlaylistProvider>(
          builder: (context, value, child) {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
              ),
              body: value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Categories id playlists",
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          height: 15.h,
                          color: Colors.amber,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: value
                                .categoryPlaylist?.playlists?.items?.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(5.0),
                                width: 30.w,
                                decoration: BoxDecoration(
                                    color: const Color(0xff2a2929),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Text(
                                  value.categoryPlaylist!.playlists!
                                      .items![index].name!,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: 4,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(10.0),
                              width: 60.w,
                              height: 3.w,
                              decoration: BoxDecoration(
                                  color: const Color(0xff2a2929),
                                  borderRadius: BorderRadius.circular(10.0)),
                            );
                          },
                        )
                      ],
                    ),
            );
          },
        );
      },
    );
  }
}
