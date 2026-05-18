import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/common/widgets/gradient.dart';
import 'package:final_servixa/common/widgets/search_field.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/core/routing/app_router.dart';
import 'package:final_servixa/features/categories/business-logic/controller/categories_controller.dart';
import 'package:final_servixa/features/categories/presentation/widgets/custom_categories.dart';
import 'package:final_servixa/features/home/presentation/widgets/custom_items.dart';
import 'package:final_servixa/features/home/presentation/widgets/custom_profile_info.dart';
import 'package:final_servixa/features/home/presentation/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Trans;

class Home extends StatelessWidget {
  Home({super.key});
  final CategoriesController categoriesController = Get.put(
    CategoriesController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGradient(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 15, top: 30, end: 15),
            child: Obx(() {
              if (categoriesController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.main500),
                );
              }
              return ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRouter.mainProfile);
                    },
                    child: CustomListTile(
                      location: 'Riyadh – Malaz',
                      name: 'Mhamad Alshame',
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24),
                      Text(
                        "header1".tr(),
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey700,
                        ),
                      ),
                      Text(
                        "header2".tr(),
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.main500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  SearchField(
                    onTap: () {
                      Get.toNamed(AppRouter.search);
                    },
                    hint: 'search'.tr(),
                    prefix: SvgPicture.asset(
                      'assets/icons/search_icon.svg',
                      width: 16.5,
                      height: 16.5,
                      fit: BoxFit.none,
                    ),
                    suffix: SvgPicture.asset(
                      'assets/icons/filter_icon.svg',
                      width: 20,
                      height: 20,
                      fit: BoxFit.none,
                    ),
                    width: MediaQuery.of(context).size.width * 0.91,
                    height: 48,
                  ),
                  SizedBox(height: 24),
                  SliderComponent(),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Text(
                        'categories'.tr(),
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.main,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          categoriesController.getMaincategories();
                          Get.toNamed(AppRouter.categor);
                        },
                        child: Text(
                          'show'.tr(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.main500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CustomCategories(
                          onTap: () async {
                            await categoriesController.selectcategory(
                              categoriesController.categories[index],
                            );
                            Get.toNamed(AppRouter.sub);
                          },
                          name: categoriesController.categories[index].name,
                          image:
                              categoriesController
                                  .categories[index]
                                  .icon
                                  ?.url ??
                              '',
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 11);
                      },
                      itemCount: categoriesController.categories.length,
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Text(
                        'tools'.tr(),
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.main,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRouter.items);
                        },
                        child: Text(
                          'show'.tr(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.main500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    child: ListView.separated(
                      itemCount: 7,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 18);
                      },
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CustomItem(
                          width: 178,
                          image: 'assets/images/item.png',
                          location: 'Riyadh – Malaz',
                          price: 500,
                          title: 'SPR Claw Hammers',
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'services'.tr(),
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.main,
                        ),
                      ),

                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'show'.tr(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.main500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,

                      itemBuilder: (context, index) {
                        return CustomItem(
                          width: 158,
                          image: 'assets/images/item.png',
                          location: 'Riyadh – Malaz',
                          price: 500,
                          title: 'SPR Claw Hammers',
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 18);
                      },
                      itemCount: 7,
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'items'.tr(),
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.main,
                        ),
                      ),

                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'show'.tr(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.main500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,

                      itemBuilder: (context, index) {
                        return CustomItem(
                          width: 263,
                          image: 'assets/images/item.png',
                          location: 'Riyadh – Malaz',
                          price: 500,
                          title: 'SPR Claw Hammers',
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 18);
                      },
                      itemCount: 7,
                    ),
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,

                      itemBuilder: (context, index) {
                        return CustomItem(
                          width: 185.5,
                          image: 'assets/images/item.png',
                          location: 'Riyadh – Malaz',
                          price: 500,
                          title: 'SPR Claw Hammers',
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 18);
                      },
                      itemCount: 7,
                    ),
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,

                      itemBuilder: (context, index) {
                        return CustomItem(
                          width: 185.5,
                          image: 'assets/images/item.png',
                          location: 'Riyadh – Malaz',
                          price: 500,
                          title: 'SPR Claw Hammers',
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 18);
                      },
                      itemCount: 7,
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
