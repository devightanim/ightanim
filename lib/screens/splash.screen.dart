import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ightanim/contents/theme.content.dart';
import 'package:ightanim/core/controllers/intro_tap.controller.dart';
import 'package:ightanim/widgets/introtap.widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final PageController _controller = PageController();
  final IntroTabController controller = Get.put(IntroTabController());

  bool lastPage = false;
  bool firstPage = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  lastPage = (index == 2);
                  firstPage = (index == 0);
                });
              },
              children: const [
                IntroTab(
                  text:'أغتنم فرصتك للتعلم أكثر  عن دينك و مقدساتك  الأسلامية',
                  svg: 'assets/images/onboarding01.png',
                ),
                IntroTab(
                  text: 'تلقَّ تذكيرات للأذكار اليومية و حتى الشهرية من خلال الإشعارات',
                  svg: 'assets/images/onboarding02.png',
                ),
                IntroTab(
                  text: 'تلقَّ تذكيرات للأذكار اليومية و حتى الشهرية من خلال الإشعارات',
                  svg: 'assets/images/onboarding03.png',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => firstPage
                      ? Get.back()
                      : _controller.animateToPage(
                      (_controller.page! - 1.0).toInt(),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease),
                  child: Container(
                    padding: const EdgeInsets.only(left: 5.5),
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                        border: Border.all(
                          // firstPage?Colors.transparent:
                            color: AppColors.grey,
                            width: .5),
                        // firstPage?Colors.transparent
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(50)),
                    // firstPage?Colors.transparent:
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.darkGrey,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
            SvgPicture.asset(controller.backgroundImage.value),
            if (lastPage)
              Padding(
                padding: EdgeInsets.only(
                  top: 450.h,
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () async {

                    },
                    child: SizedBox(
                      width: 161.w,
                      height: 48.h,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 161.w,
                              height: 48.h,
                              decoration: ShapeDecoration(
                                color: AppColors.primaryGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 41.w,
                            top: 13.h,
                            child: Text(
                              'Get Started',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

