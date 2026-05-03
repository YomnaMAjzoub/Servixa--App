import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_servixa/core/constants/app_colors.dart';

class RatingBottomSheet extends StatelessWidget {
  const RatingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 9,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/icons/Vector.svg',
                width: 23.25,
                height: 20.6,
                fit: BoxFit.none,
              ),
              Text(
                'Rate this Ad',
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: SvgPicture.asset(
                  'assets/icons/exit.svg',
                  width: 24,
                  height: 24,
                  fit: BoxFit.none,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),

          Center(
            child: RatingBar.builder(
              initialRating: 0,
              minRating: 0,
              maxRating: 5,
              direction: Axis.horizontal,
              glowColor: AppColors.main400,
              //  allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.all(6),
              itemBuilder: (context, index) {
                return Icon(Icons.star, size: 35, color: AppColors.main400);
              },
              onRatingUpdate: (value) {
                log(value.toString());
              },
            ),
          ),
          SizedBox(height: 6),
          Center(
            child: Text(
              'Rate by clicking on a star',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.grey200,
              ),
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.89,
              height: MediaQuery.of(context).size.height * 0.14,
              child: TextFormField(
                maxLines: 10,
                // maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: ' Share your Thought...',
                  hintStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey200,
                  ),
            
                  //contentPadding: EdgeInsets.all(16),
                  //alignLabelWithHint: true,
                  prefixIconConstraints: BoxConstraints(
                    minHeight: 24,
                    minWidth: 19,
                  ),
                  prefix: SvgPicture.asset(
                    'assets/icons/field.svg',
                    width: 24,
                    height: 19,
                    fit: BoxFit.none,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(width: 1, color: AppColors.grey200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(width: 1, color: AppColors.grey200),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(width: 1, color: AppColors.grey200),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.43,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(width: 1, color: AppColors.main500),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.main500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.43,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.main500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(width: 1, color: AppColors.main500),
                    ),
                  ),
                  onPressed: () {
                    //  not finished yet
                    Get.back();
                    Get.snackbar(
                      'Thank you for your feedback',
                      'Your feedback has been submitted successfully.',
                      backgroundColor: AppColors.main500,
                      colorText: AppColors.white,
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 3),
                    );
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.yellow,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
