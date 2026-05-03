import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/common/widgets/gradient.dart';
import 'package:final_servixa/common/widgets/search_field.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/core/routing/app_router.dart';
import 'package:final_servixa/features/categories/presentation/widgets/categories_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart'hide Trans;


class SubCategoryScreen extends StatelessWidget {
  SubCategoryScreen({super.key});

  final names = ['Heavy Vehicles', 'Logistics', 'Interior Design'];

  final icons = [
    'assets/icons/heavy.svg',
    'assets/icons/logistic.svg',
    'assets/icons/interiorDesign.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGradient(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 10,
              vertical: 24,
            ),
            child: CustomScrollView(
              slivers: [
                
                SliverToBoxAdapter(
                  child: Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.offNamed(AppRouter.categor);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 22.05,
                        color: AppColors.grey700,
                      ),
                    ),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 16)),

               
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Text(
                        'sub1'.tr(),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.main500,
                        ),
                      ),
                      Text(
                        'sub2'.tr(),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey700,
                        ),
                      ),
                    ],
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 24)),

                
                SliverToBoxAdapter(
                  child: SearchField(
                    hint: 'search'.tr(),
                    prefix: SvgPicture.asset(
                      'assets/icons/search_icon.svg',
                      width: 16,
                      height: 16,
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
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 24)),

                CategoriesGrid(names: names, icons: icons),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
