import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_project/core/const/color_const/app_colors.dart';
import 'package:spotify_api_project/core/const/images/app_images.dart';
import 'package:spotify_api_project/features/base/provider/base_provider.dart';
import 'package:spotify_api_project/features/home/view/home_screen_view.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BaseProvider>(
      create: (context) => BaseProvider(context),
      builder: (context, child) {
        return Consumer<BaseProvider>(
          builder: (context, provider, child) {
            return Scaffold(
              body: provider.getBody(),
              bottomNavigationBar: BottomNavigationBar(
                elevation: 0,
                showSelectedLabels: true,
                selectedLabelStyle:
                    const TextStyle(color: AppColors.textPrimaryColor),
                backgroundColor: AppColors.bgColor,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                currentIndex: provider.currentIndex,
                onTap: (value) => provider.setCurrentIndex(value),
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      AppImages.bottomHome,
                      color: provider.currentIndex == 0
                          ? Colors.white
                          : Colors.grey,
                    ),
                    label: "Anasayfa",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      AppImages.bottomSearch,
                      color: provider.currentIndex == 1
                          ? Colors.white
                          : Colors.grey,
                    ),
                    label: "Arama",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      AppImages.bottomProfile,
                      color: provider.currentIndex == 2
                          ? Colors.white
                          : Colors.grey,
                    ),
                    label: "Profil",
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
