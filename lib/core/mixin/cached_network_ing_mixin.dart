import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotify_api_project/core/mixin/shimmer_mixin.dart';

mixin CachedNetworkMixin {
  Widget cachedNetworkManager({required String imgUrl, BoxFit? fit}) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      fit: fit ?? BoxFit.contain,
      placeholder: (context, url) => ShimmerLoadig(
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
