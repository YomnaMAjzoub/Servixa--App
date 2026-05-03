import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/services/data/models/review_model.dart';
import 'package:final_servixa/features/services/presentation/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TopReviewsSection extends StatelessWidget {
  
  final List<ReviewModel> reviews;

  const TopReviewsSection({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Reviews",
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Show All",
                  style: TextStyle(
                    color: AppColors.main500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          Column(
            children: reviews
                .map((review) => ReviewCard(review: review))
                .toList(),
          ),
        ],
      ),
    );
  }
}