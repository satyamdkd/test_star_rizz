import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:starrizz/app/appColor/color.dart';
import 'package:starrizz/app/customWidgets/component/appBar.dart';
import 'package:starrizz/app/customWidgets/component/customText.dart';
import 'package:starrizz/app/modules/dashBoard/dashboard/home/productList.dart';
import 'package:starrizz/app/modules/dashBoard/dashboard/home/simmerLoading/simmerLoader.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}bool _isLoading = true;
// @override
// void initState() {
//   super.initState();
//   // Simulate a delay (e.g., fetching data from API)
//   Future.delayed(Duration(seconds: 3), () {
//     setState(() {
//       _isLoading = false;
//       _data = List.generate(10, (index) => "Item ${index + 1}");
//     });
//   });
// }
class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay (e.g., fetching data from API)
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
        //_data = List.generate(10, (index) => "Item ${index + 1}");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70.0), child: CustomAppBar()),
      body:  _isLoading
          ? ShimmerLoadingList() :Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: Colors.grey.withOpacity(0.1)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),
                    Icon(
                      Icons.search,
                      color: Colors.black.withOpacity(0.6),
                      size: 24.h,
                    ),
                    SizedBox(width: 4.w),
                    CustomText(
                      text: "Search",
                      size: 14.sp,
                      weight: FontWeight.w400,
                      color: Colors.grey,
                      textScaler: TextScaler.noScaling,
                    )
                  ],
                ),
              ),
              viewPager(context),
              SizedBox(height: 10.h),
              seeAll(context, title: "Sports", subTitle: "See All", onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  ProductListPage()));
              }),
              SizedBox(height: 8.h),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 6,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: MediaQuery.sizeOf(context).width / 3.2,
                        margin: EdgeInsets.only(right: 10.w),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.sizeOf(context).height / 9.5,
                              width: MediaQuery.sizeOf(context).width / 3.2,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/image/virat.png"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                text: "Virat Kohli",
                                size: 12.sp,
                                weight: FontWeight.w600,
                                textScaler: TextScaler.noScaling,
                                maxLines: 1,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(height: 20.h),
              seeAll(context, title: "Entertainment", subTitle: "See All",
                  onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  ProductListPage()));
              }),
              SizedBox(height: 8.h),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 5.2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return itemView(
                          "assets/image/entertainment.png", "Actors/Actresses");
                    }),
              ),
              SizedBox(height: 20.h),
              seeAll(context, title: "Music", subTitle: "See All", onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  ProductListPage()));
              }),
              SizedBox(height: 8.h),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 5.2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return itemView(
                          "assets/image/girl.png", "Actors/Actresses");
                    }),
              ),
              SizedBox(height: 20.h),
              seeAll(context, title: "Fashion", subTitle: "See All", onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  ProductListPage()));
              }),
              SizedBox(height: 8.h),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 5.2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return itemView(
                          "assets/image/person.png", "Actors/Actresses");
                    }),
              ),
              SizedBox(height: 70.h),
            ],
          ),
        ),
      ),
    );
  }

  Row seeAll(
    BuildContext context, {
    required String title,
    required String subTitle,
    required void Function() onTap,
  }) {
    return Row(
      children: [
        CustomText(
          text: title,
          size: 15,
          weight: FontWeight.w600,
        ),
        const Spacer(),
        GestureDetector(
            onTap: onTap,
            child: CustomText(
              text: subTitle,
              size: 12.sp,
              weight: FontWeight.w400,
              color: Colors.blue,
              textScaler: TextScaler.noScaling,
            )),
      ],
    );
  }

  Widget itemView(String url, String name) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Container(
        width: MediaQuery.sizeOf(context).width / 3.2,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height / 8,
              width: MediaQuery.sizeOf(context).width / 3.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(url), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: name,
                size: 12.sp,
                weight: FontWeight.w600,
                textScaler: TextScaler.noScaling,
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }

  final pageController = PageController();
  int viewPagerCount = 0;
  int itemCount = 3;

  List imageList = [
    "assets/images/one.jpeg",
    "assets/images/two.jpeg",
    "assets/images/three.jpeg",
  ];

  onViewPagerChanged(int index) {
    viewPagerCount = index;
    setState(() {});
  }

  viewPager(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 4.2,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              onViewPagerChanged(index);
            },
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 4.w,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.w),
                  child: pagerImage("assets/image/shoe_image.png"),
                ),
              );
            },
          ),
        ),
        Center(
          child: AnimatedSmoothIndicator(
            activeIndex: viewPagerCount,
            count: 3,
            effect: WormEffect(
              activeDotColor: AppColors.primaryColor,
              dotWidth: 12.w,
              dotHeight: 12.w,
              dotColor: Colors.grey.withOpacity(0.3),
            ),
          ),
        ),
      ],
    );
  }

  pagerImage(imageUrl, {height, width}) {
    return Container(
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.contain),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
    );
  }

  /// pagerImage(imageUrl, {height, width}) {
  ///   return CachedNetworkImage(
  ///     imageUrl: imageUrl == null || imageUrl == ""
  ///         ? "https:///t3.ftcdn.net/jpg/00/36/94/26/360_F_36942622_9SUXpSuE5JlfxLFKB1jHu5Z07eVIWQ2W.jpg"
  ///         : imageUrl,
  ///     imageBuilder: (context, imageProvider) => Container(
  ///       height: height ?? 160.w,
  ///       width: width ?? MediaQuery.of(context).size.width,
  ///       decoration: BoxDecoration(
  ///         image: DecorationImage(
  ///           image: imageProvider,
  ///           fit: BoxFit.fill,
  ///         ),
  ///       ),
  ///     ),
  ///     placeholder: (context, url) => Container(
  ///       decoration: const BoxDecoration(
  ///         color: Color(0xffeeeeee),
  ///       ),
  ///     ),
  ///     errorWidget: (context, value, error) {
  ///       return Container(
  ///         decoration: BoxDecoration(
  ///           image: const DecorationImage(
  ///             image: NetworkImage(
  ///                 "https:///t3.ftcdn.net/jpg/00/36/94/26/360_F_36942622_9SUXpSuE5JlfxLFKB1jHu5Z07eVIWQ2W.jpg"),
  ///             fit: BoxFit.cover,
  ///           ),
  ///           color: AppColors.white,
  ///         ),
  ///       );
  ///     },
  ///   );
  /// }
}
