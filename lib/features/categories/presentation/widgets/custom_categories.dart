import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';




class CustomCategories extends StatelessWidget {
  const CustomCategories({super.key, required this.name, required this.image,this.onTap});
  final String name;
  final String image;
    final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        width: 120,
        height: 84,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(26)),
          color: AppColors.main50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            SvgPicture.asset(image, width: 34, height: 34, fit: BoxFit.none),
            Text(
              name,
              style: GoogleFonts.poppins(
               textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.grey600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
