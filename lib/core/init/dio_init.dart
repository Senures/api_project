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
              "Bearer BQDNunsAzAJPExzFnI9YANkJATv8FJna_9qg_ivilQ6CoIMgWefplTutzgHzXIgg5Oj8UAVcnuFr9eWA1Wx1UBkMhmpmIgzMuVFNV_8Wg879cquMzSYQmi2wVmc7ZFDBh38_ArKQ5_AIerQ2JOLo4VMAvZP7Vw0SyhFTlGDL4knuvgS8slCeOIm1cgbzxLeNBzRKovZmawkJPV09mALrrD5MQjFM97oSWFVMyu8ovSj3pGo188nOSh6LPvWwasFFcfgvH_AYvQeRBCJNIsUq7ijkQdRo59L0VLc-uNJ16Sba"
        },
      ),
    );
  }
}
