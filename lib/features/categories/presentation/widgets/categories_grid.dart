import 'package:final_servixa/core/routing/app_router.dart';
import 'package:final_servixa/features/categories/business-logic/controller/categories_controller.dart';
import 'package:final_servixa/features/categories/data/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_categories.dart';

class CategoriesGrid extends StatelessWidget {
  CategoriesGrid({
    super.key,
    required this.categories,
    required this.isSubcategory,
  });
  final controller = Get.find<CategoriesController>();
  final List<CategoriesModel> categories;
  final bool isSubcategory;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return CustomCategories(
          onTap: () async {
            if (isSubcategory) {
              await controller.selectSubCategory(categories[index]);
            } else if (categories[index].hasChildren) {
              await controller.selectcategory(categories[index]);
              Get.toNamed(AppRouter.sub);

            } else {
              await controller.selectSubCategory(categories[index]);
            
            }
          },
          name: categories[index].name,
          image: categories[index].icon?.url ?? '',
        );
      }, childCount: categories.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 32,
        childAspectRatio: 1.5,
      ),
    );
  }
}
