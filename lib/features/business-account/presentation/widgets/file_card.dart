import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadFileCard extends StatelessWidget {
  const UploadFileCard({
    super.key,
    required this.name,
     this.size,
    required this.isPdf,
    required this.onView,
  });
  final double? size;
  final String name;
  final bool isPdf;
  final VoidCallback onView;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey100),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(
            isPdf ? Icons.picture_as_pdf : Icons.image,
            color: AppColors.red,
          ),

          SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: AppColors.grey800,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  "Max Size $size MB",
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey300,
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: onView,
            child: Text(
              "view".tr(),
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: AppColors.main500,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
