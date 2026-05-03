import 'package:final_servixa/features/services/data/models/rating_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_servixa/core/constants/app_colors.dart';


class ContactSection extends StatelessWidget {
  const ContactSection({super.key, required this.rating});

  final RatingSummary rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rating.average.toString(),
                style: GoogleFonts.roboto(
                  fontSize: 39,
                  fontWeight: FontWeight.w700,
                  color: AppColors.main500,
                ),
              ),

              const SizedBox(height: 4),

              RatingBarIndicator(
                rating: rating.average,
                itemBuilder: (context, index) =>
                    Icon(Icons.star, color: AppColors.main500),
                itemCount: 5,
                itemSize: 18,
              ),

              const SizedBox(height: 6),

              Text(
                "Reviews ${rating.totalReviews}",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.dark,
                ),
              ),
            ],
          ),

          const SizedBox(width: 24),

          Expanded(
            child: Column(
              children: List.generate(5, (index) {
                int star = 5 - index;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 36,
                        child: Text(
                          "${(rating.distribution[star]! * 100).toInt()}%",
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.dark,
                          ),
                        ),
                      ),

                      Expanded(
                        child: LinearProgressIndicator(
                          value: rating.distribution[star],
                          minHeight: 6,
                          borderRadius: BorderRadius.circular(13),
                          backgroundColor: AppColors.secondary,
                          valueColor: AlwaysStoppedAnimation(AppColors.main500),
                        ),
                      ),

                      const SizedBox(width: 8),

                      Row(
                        children: [
                          Icon(Icons.star, size: 14, color: AppColors.main500),
                          const SizedBox(width: 2.5),
                          Text(star.toString(),style: GoogleFonts.roboto(fontSize:12,fontWeight:FontWeight.w500,color:AppColors.dark),),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
