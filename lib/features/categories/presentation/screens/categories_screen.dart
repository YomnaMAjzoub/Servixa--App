import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/common/widgets/gradient.dart';
import 'package:final_servixa/common/widgets/search_field.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/categories/business-logic/controller/categories_controller.dart';
import 'package:final_servixa/features/categories/presentation/widgets/categories_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});
  final controller = Get.find<CategoriesController>();

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
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator(color: AppColors.main500));
              } else if (controller.categories.isEmpty) {
                return Center(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/empty.png', 
                    width:MediaQuery.of(context).size.width*0.75, 
                    height:MediaQuery.of(context).size.height*0.26,
                     fit: BoxFit.none),
                    SizedBox(height: 16),
                    Text(
                      'empty_title'.tr(),
                      style:  GoogleFonts.roboto(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: AppColors.main500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'empty_subtitle'.tr(),
                      style:  GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey300,
                      ),
                    ),
                  ],
                ));
              }
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Align(
                      alignment: AlignmentGeometry.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
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
                          'category1'.tr(),
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey700,
                          ),
                        ),
                        Text(
                          'category2'.tr(),
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: AppColors.main500,
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

                  CategoriesGrid(categories:controller.categories, isSubcategory: false,),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
