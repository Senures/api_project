import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_project/core/init/dio_init.dart';
import 'package:spotify_api_project/features/home/view/home_screen_view.dart';

void main() {
  runApp(const MyApp());
}

Dio dio = NetworkManagerDio.instance.dio;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const MaterialApp(
          // home: SearchScreenView(),
          home: HomeScreenView(),
        );
      },
    );
  }
}
