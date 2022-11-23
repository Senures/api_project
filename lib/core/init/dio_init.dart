import 'package:dio/dio.dart';

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
        headers: {
          "Authorization":
              "Bearer BQBg33hAOhMY9V4UpeBPA4OAVorYC8Xq5q7VdRjlsWyUx8hkpEFE0FXCXxJ7NBZN3yWAk4WIbt3yWJkTX3FArfVY59sc0eOycP9tC2AoEDPbCRAkQnE8Gq01NYQ9wcNTU81d13Zc-69vG71w97BPFfjtAlv04dbSWd1ulkmEFE7WvtYTIUEV8jYpcTTkeM94KPFJUskYW6N0Xkp-XHVsbzPcySMup_5MP8Pzw85Co41RE_BR6irFywqfaWXxN9jVf5Baxk6EL71_6UWeEP_dKl20tGf53s-d5k1JP7PYl5-h"
        },
      ),
    );
  }
}
