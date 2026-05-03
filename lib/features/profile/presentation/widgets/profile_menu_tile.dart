import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class ProfileMenuTile extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  final Color? textColor;

  const ProfileMenuTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.divider,
            ),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width:24,
              height: 24,
              fit: BoxFit.none,
            ),

            const SizedBox(width:12),

            Expanded(
              child: Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: textColor ?? AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const Icon(
              Icons.chevron_right,
              color: AppColors.main500,
            ),
          ],
        ),
      ),
    );
  }
}