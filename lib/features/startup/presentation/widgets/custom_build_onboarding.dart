
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class BuildOnboardingPage extends StatelessWidget {
  const BuildOnboardingPage({
    super.key,
    required this.description,
    required this.image,
    required this.title
    });
  final String image;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          SvgPicture.asset(
            image,
            height: MediaQuery.of(context).size.height * 0.377,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 40.0),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
