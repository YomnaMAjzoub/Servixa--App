import 'package:flutter/material.dart';
import 'package:final_servixa/core/constants/app_colors.dart';

class DescriptionSection extends StatefulWidget {
  const DescriptionSection({super.key});

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {

  bool expanded = false;

  final String description =
      "Specialize in delivering high-quality construction solutions tailored "
      "to meet the unique needs of residential, commercial, and industrial "
      "clients. With years of experience in the industry.";

  @override
  Widget build(BuildContext context) {

    return Container(
      color: AppColors.white,
      margin: EdgeInsetsDirectional.only(top: 8),
      padding:EdgeInsetsDirectional.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(
              fontSize: 22,
              color: AppColors.main,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height:16),

          
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            child: Text(
              description,
              maxLines: expanded ? null : 6,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.4,
                color: AppColors.grey300,
              ),
            ),
          ),

          const SizedBox(height: 4),

         
          GestureDetector(
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            child: Text(
              expanded ? "More..." : "Less...",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.main500,
              ),
            ),
          )
        ],
      ),
    );
  }
}