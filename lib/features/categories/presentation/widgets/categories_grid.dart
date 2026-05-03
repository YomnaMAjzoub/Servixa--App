import 'package:final_servixa/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_categories.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key, required this.names, required this.icons});

  final List<String> names;
  final List<String> icons;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return CustomCategories(
          onTap: () {
            Get.toNamed(AppRouter.sub);
          },
          name: names[index],
          image: icons[index],
        );
      }, childCount: names.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 32,
        childAspectRatio: 1.5,
      ),
    );
  }
}
