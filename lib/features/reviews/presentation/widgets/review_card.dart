import 'package:final_servixa/features/reviews/data/models/review_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_servixa/core/constants/app_colors.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.review,
  });

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color:AppColors.secondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(review.image),
              ),

              const SizedBox(width:12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      review.name,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.main10
                      ),
                    ),

                    Text(
                      review.date,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color:AppColors.dark,
                      ),
                    ),
                  ],
                ),
              ),

          
              Row(
                children: [
                  Text(review.rating.toString(),style: GoogleFonts.roboto(fontSize:12,fontWeight: FontWeight.w500,color:AppColors.dark),),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.star,
                    color: AppColors.main500,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),

    
          Text(
            review.review,
            style: GoogleFonts.roboto(
              fontSize: 12,
              color: AppColors.dark,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}