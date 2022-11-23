import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreenView extends StatelessWidget {
  const SearchScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 47.h,
            //color: Colors.amber,
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                searchBarTitle(),
                searchBar(),
                SizedBox(
                  height: 8.h,
                  //color: Colors.red,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xff0E0E0F),
                            borderRadius: BorderRadius.circular(10.0)),
                        margin: const EdgeInsets.only(right: 13.0, top: 13.0),
                        width: 20.w,
                        child: const Text(
                          "artist",
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 8.h,
                  //color: Colors.red,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xff0E0E0F),
                            borderRadius: BorderRadius.circular(10.0)),
                        margin: const EdgeInsets.only(right: 6.0, top: 13.0),
                        width: 27.w,
                        child: const Text(
                          "artist",
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 3.w,
            ),
            child: const Text(
              "Hepsine göz at",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: .5,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
         /*  GridView.builder(
            shrinkWrap: true,
            gridDelegate:
               const  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Container(
                width: 50.w,
                height: 10.h,
                color: Colors.red,
              );
            },
          ) */
        ],
      ),
    );
  }
}

searchBarTitle() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
      Text(
        "Search",
        style: TextStyle(
            letterSpacing: .5,
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.bold),
      ),
      Icon(
        Icons.more_vert_outlined,
        color: Colors.white,
        size: 30.0,
      )
    ],
  );
}

searchBar() {
  return Container(
    height: 7.h,
    margin: EdgeInsets.symmetric(vertical: 2.h),
    decoration: BoxDecoration(
        color: const Color(0xff0E0E0F),
        borderRadius: BorderRadius.circular(10.0)),
    child: TextFormField(
      style: const TextStyle(color: Colors.white),
      textAlignVertical: TextAlignVertical.center,
      showCursor: false,
      decoration: const InputDecoration(
          hintText: "Artists,songs or podcasts",
          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search_outlined,
            color: Colors.white,
          )),
    ),
  );
}
