import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              appBar: AppBar(),
              body: value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount:
                          value.categoryPlaylist?.playlists?.items?.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(value.categoryPlaylist!.playlists!
                              .items![index].name!),
                        );
                      },
                    ),
            );
          },
        );
      },
    );
  }
}
