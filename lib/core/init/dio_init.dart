import 'package:dio/dio.dart';

import '../const/url_const/url_const.dart';

class NetworkManagerDio {
  static NetworkManagerDio? _instance;

  late Dio dio;

  static NetworkManagerDio get instance {
    if (_instance == null) {
      _instance = NetworkManagerDio._init();
      return _instance!;
    }

    return _instance!;
  }

  NetworkManagerDio._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://api.spotify.com/v1",
        headers: {"Authorization": "Bearer ${UrlConst.ACCESS_TOKEN}"},
      ),
    );
  }
}
