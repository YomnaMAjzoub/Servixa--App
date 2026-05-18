import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/core/routing/app_router.dart';
import 'package:final_servixa/features/categories/business-logic/controller/categories_controller.dart';
import 'package:final_servixa/features/home/presentation/screens/home_screen.dart';
import 'package:final_servixa/features/home/presentation/widgets/nav_bar_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' hide Trans;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double getSelectorPosition(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double itemWidth = width / 5;

    num positionIndex = selectedIndex < 2 ? selectedIndex : selectedIndex + 1;

    return itemWidth * positionIndex + (itemWidth / 2) - 26.36;
  }

  int selectedIndex = 0;

  final pages = [ Home(), Home(),  Home(),  Home()];

  void changeTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget navItem(int index, String label, String icon, String selectedIcon) {
    final selected = index == selectedIndex;

    return Expanded(
      child: GestureDetector(
        onTap: () => changeTab(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              selected ? selectedIcon : icon,
              width: 24.81,
              height: 24,
            ),

            const SizedBox(height: 4),

            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: selected ? AppColors.main500 : AppColors.grey200,
              ),
            ),
          ],
        ),
      ),
    );
  }

 // final CategoriesController categoriesController = Get.put(CategoriesController());

   @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainScreen,
      extendBody: true,
      body: pages[selectedIndex],

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Transform.translate(
        offset: Offset(0, -10),
        child: InkWell(
          onTap: () {
            Get.toNamed(AppRouter.addService);
          },
          child: Container(
            height: 64.09,
            width: 62.01,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.main500,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: .25),
                  blurRadius: 7,
                  spreadRadius: 0,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/icons/add.svg",
                width: 16.63,
                height: 16.63,
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 69.22,
        child: Stack(
          children: [
            
            CustomPaint(
              size: const Size(double.infinity, 69.22),
              painter: NavBarPainter(fabRadius: 37.78),
            ),

            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              top: 0,
              left: getSelectorPosition(context),
              child: Container(
                width: 52.72,
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.main500,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
              ),
            ),

           
            Row(
              children: [
                navItem(
                  0,
                  "home".tr(),
                  "assets/icons/home.svg",
                  "assets/icons/home2.svg",
                ),

                navItem(
                  1,
                  "notify".tr(),
                  "assets/icons/notify.svg",
                  "assets/icons/notify2.svg",
                ),

                Spacer(),

                navItem(
                  2,
                  "ads".tr(),
                  "assets/icons/ads.svg",
                  "assets/icons/ads2.svg",
                ),

                navItem(
                  3,
                  "orders".tr(),
                  "assets/icons/orders.svg",
                  "assets/icons/orders2.svg",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
