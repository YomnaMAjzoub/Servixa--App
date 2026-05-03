import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BusinessAccountCard extends StatelessWidget {
  const BusinessAccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.main100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [

      
          Expanded(
            child: Text(
              "Business Account",
              style: GoogleFonts.roboto(
                fontSize: 12,
                color: AppColors.black,
              ),
            ),
          ),

          const SizedBox(width: 10),

         
          SizedBox(
            height: 28,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                ),
                backgroundColor: AppColors.main500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Text(
                "Change",
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  color: AppColors.yellow,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}