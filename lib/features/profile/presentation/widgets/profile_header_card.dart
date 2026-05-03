import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/core/routing/app_router.dart';
import 'package:final_servixa/features/profile/presentation/widgets/business_account_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.shadow2, AppColors.shadow4],
        ),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 36, backgroundColor: AppColors.white),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ahmad Alshame",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/location_icon.svg",
                          width: 12,
                          height: 12,
                        ),

                        const SizedBox(width: 4),

                        Flexible(
                          child: Text(
                            "Riyadh – Malaz",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              SizedBox(
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRouter.updateProfile);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    backgroundColor: AppColors.main500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.edit, size: 14, color: AppColors.yellow),

                      const SizedBox(width: 4),

                      Text(
                        "Edit",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: AppColors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          const Divider(color: AppColors.main100, thickness: 1, height: 1),

          const SizedBox(height: 14),

          const BusinessAccountCard(),
        ],
      ),
    );
  }
}
