import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/common/widgets/gradient.dart';
import 'package:final_servixa/common/widgets/search_field.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/core/routing/app_router.dart';
import 'package:final_servixa/features/home/presentation/widgets/items_grid.dart';
import 'package:final_servixa/features/search-filters/presentation/screens/filter_bottomsheet.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_fonts/google_fonts.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGradient(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
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
                        Get.offNamed(AppRouter.home);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 22.05,
                        color: AppColors.grey700,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 24)),
                SliverToBoxAdapter(
                  child: SearchField(
                    hint: 'search'.tr(),
                    prefix: SvgPicture.asset(
                      'assets/icons/search_icon.svg',
                      width: 16,
                      height: 16,
                      fit: BoxFit.none,
                    ),
                    suffix: IconButton(
                      onPressed: () {
                        Get.bottomSheet(FilterSheet());
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/filter_icon.svg',
                        width: 20,
                        height: 20,
                        fit: BoxFit.none,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: 48,
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 16)),

                SliverToBoxAdapter(
                  child: Text(
                    'Popular Ads',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: AppColors.main,
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 16)),

                ItemsGrid(
                  image: 'assets/images/item.png',
                  title: 'Riyadh – Malaz',
                  location: 'Riyadh – Malaz',
                  price: 500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
