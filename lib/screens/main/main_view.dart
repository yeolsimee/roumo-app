import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:roumo_flutter/gen/assets.gen.dart';
import 'package:roumo_flutter/screens/main/home/home_screen.dart';
import 'package:roumo_flutter/screens/main/my_page/my_page_screen.dart';
import 'package:roumo_flutter/screens/main/recommend/recommend_screen.dart';
import 'package:roumo_flutter/ui/text_style.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with WidgetsBindingObserver {
  int page = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      FlutterAppBadger.removeBadge();
    }
  }

  @override
  Widget build(BuildContext context) {
    final icons = getBottomIcons(page);

    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: page,
        children: const [
          HomeScreen(),
          RecommendScreen(),
          MyPageScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 100.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: onTapPage(0),
              child: Container(
                color: Colors.transparent,
                width: 114.w,
                height: 60.h,
                child: Column(
                  children: [
                    SelectedBarBy(0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, top: 9),
                      child: SvgPicture.asset(
                        icons[0],
                        width: 20.w,
                        height: 20.w,
                      ),
                    ),
                    Text(Intl.message('home'), style: textStyleBy(0)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: onTapPage(1),
              child: Container(
                color: Colors.transparent,
                width: 114.w,
                height: 60.h,
                child: Column(
                  children: [
                    SelectedBarBy(1),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, top: 9),
                      child: SvgPicture.asset(
                        icons[1],
                        width: 20.w,
                        height: 20.w,
                      ),
                    ),
                    Text(Intl.message('routineRecommend'), style: textStyleBy(1)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: onTapPage(2),
              child: Container(
                color: Colors.transparent,
                width: 114.w,
                height: 60.h,
                child: Column(
                  children: [
                    SelectedBarBy(2),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, top: 9),
                      child: SvgPicture.asset(
                        icons[2],
                        width: 20.w,
                        height: 20.w,
                      ),
                    ),
                    Text(Intl.message('myPage'), style: textStyleBy(2)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle textStyleBy(int index) =>
      page == index ? style10Bold : style10Normal;

  Widget SelectedBarBy(int index) =>
      page == index ? SelectedBar(Colors.white) : SelectedBar(Colors.black);

  List<String> getBottomIcons(int page) {
    final enabledIcons = [
      Assets.images.iconHomeOn,
      Assets.images.iconRoutineOn,
      Assets.images.iconMypageOn,
    ];

    final disabledIcons = [
      Assets.images.iconHomeOff,
      Assets.images.iconRoutineOff,
      Assets.images.iconMypageOff,
    ];

    final icons = <String>[];

    for (var i = 0; i < 3; i++) {
      if (i == page) {
        icons.add(enabledIcons[i]);
      } else {
        icons.add(disabledIcons[i]);
      }
    }
    return icons;
  }

  Widget SelectedBar(Color color) {
    return Container(
      width: 50.w,
      height: 3.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2.5.r),
      ),
    );
  }

  void Function() onTapPage(int page) => () {
    setState(() {
      this.page = page;
    });
  };
}
