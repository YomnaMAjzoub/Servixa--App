import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/categories/presentation/widgets/custom_categories.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectSubCategoryStep extends StatelessWidget {
  const SelectSubCategoryStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
      child:SingleChildScrollView(
        child: Column(
          children:[
            SizedBox(
                  width: 101,
                  height: 101,
                  child: SvgPicture.asset(
                    'assets/icons/sub-categ-icon.svg',
                    fit: BoxFit.none,
                    width: 80,
                    height: 80,
                    alignment: AlignmentGeometry.topCenter,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'service_title_step2'.tr(),
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey700,
                  ),
                ),
        
                SizedBox(height: 24),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.91,
                  height: MediaQuery.of(context).size.height * 0.54,
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.3,
                    ),
                    itemCount: 7, // Replace with your actual category count
                    itemBuilder: (context, index) {
                      return CustomCategories(name: 'equipment', image:'assets/icons/tools.svg',);
                    },
                  ),
                ),
          ],
        ),
      ),
      );
  }
}