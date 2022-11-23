import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_project/features/home/provider/home_provider.dart';

import '../../category_playlists/view/category_playlist_view.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(context),
          builder: (context, widget) {
            return Consumer<HomeProvider>(builder: (context, provider, widget) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customAppbar(),
                    firstCategory(),
                    firstGrid(provider),
                    titleSecondList(),
                    Container(
                      height: 29.h,
                      // color: Colors.red,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  width: 44.w,
                                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff2a2929),
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "asdoafopsetıor,",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Text(
                                        "title,",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            });
          }),
    );
  }
}

customAppbar() {
  return Container(
    width: 200.w,
    height: 10.h,
    margin: EdgeInsets.symmetric(horizontal: 4.w),
    decoration: const BoxDecoration(color: Colors.black),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        appBarLeading(),
        Image.asset("assets/actions.png"),
      ],
    ),
  );
}

appBarLeading() {
  return const Text(
    "Günaydın",
    style: TextStyle(
        color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w500),
  );
}

firstCategory() {
  return Container(
    height: 8.h,
    margin: EdgeInsets.only(top: 3.h),
    //color: Colors.red,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0.07.h),
          // width: 30.w,
          height: 5.w,
          decoration: BoxDecoration(
              color: const Color(0xff2a2929),
              borderRadius: BorderRadius.circular(30.0)),
          child: const Text(
            "Müzik",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
        );
      },
    ),
  );
}

firstGrid(HomeProvider provider) {
  return provider.isLoading
      ? const Center(child: CircularProgressIndicator())
      : Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: provider.categoryList?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2.0),
            itemBuilder: (context, index) {
              var categoryItem = provider.categoryList![index];

              return InkWell(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          CategoryPlaylistView(categoryId: categoryItem.id!),
                    ),
                  );
                },
                child: Container(
                  width: 50.w,
                  height: 10.h,
                  margin:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.7.h),
                  decoration: BoxDecoration(
                      color: const Color(0xff2a2929),
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.network(categoryItem.icons![0].url!),
                      ),
                      Expanded(flex: 3, child: Container())
                    ],
                  ),
                ),
              );
            },
          ),
        );
}

titleSecondList() {
  return Padding(
    padding: EdgeInsets.only(left: 3.w, top: 1.h, bottom: 1.h),
    child: const Text(
      "Hoşuna gidebilicek programlar",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 21.0),
    ),
  );
}
