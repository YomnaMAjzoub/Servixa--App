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

    required this.onDelete,
  });

  final double? size;

  final String name;

  final bool isPdf;

  final VoidCallback onView;

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 16,
      ),

      decoration: BoxDecoration(

        color: AppColors.white,

        borderRadius:
            BorderRadius.circular(18),

        border: Border.all(
          color: AppColors.grey100,
        ),
      ),

      child: Row(

        children: [

          Icon(
            isPdf
                ? Icons.picture_as_pdf
                : Icons.image,

            color: isPdf
                ? Colors.red
                : AppColors.main500,

            size: 28,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(

                  name,

                  maxLines: 1,

                  overflow:
                      TextOverflow.ellipsis,

                  style: GoogleFonts.roboto(

                    fontSize: 14,

                    color:
                        AppColors.grey800,

                    fontWeight:
                        FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 4),

                Text(

                  size != null
                      ? "Max Size ${size!.toStringAsFixed(1)} MB"
                      : "Document",

                  style: GoogleFonts.roboto(

                    fontSize: 12,

                    fontWeight:
                        FontWeight.w400,

                    color:
                        AppColors.grey300,
                  ),
                ),
              ],
            ),
          ),

          Column(

            children: [

              GestureDetector(

                onTap: onView,

                child: Text(

                  "view".tr(),

                  style:
                      GoogleFonts.roboto(

                    fontSize: 14,

                    color:
                        AppColors.main500,

                    fontWeight:
                        FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              GestureDetector(

                onTap: onDelete,

                child: Icon(

                  Icons.delete_outline,

                  color: Colors.red.shade400,

                  size: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}