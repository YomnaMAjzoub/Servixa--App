import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/services/presentation/widgets/rating_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsetsDirectional.all(16),
      margin: EdgeInsetsDirectional.only(top: 8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.93,
        height: 51,
        child: ElevatedButton(
          onPressed: () {
            Get.bottomSheet(RatingBottomSheet());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: AppColors.main300),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            spacing: 6,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/Vector.svg',
                width: 23.25,
                height: 20.5,
                fit: BoxFit.none,
              ),
              Text(
                'Rate this Ad',
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
