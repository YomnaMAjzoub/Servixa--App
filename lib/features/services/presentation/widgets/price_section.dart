import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:final_servixa/core/constants/app_colors.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsetsDirectional.all(12),
          decoration: BoxDecoration(color: AppColors.white),
          child: Column(
            spacing: 6,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "500 SAK, ",
                          style: TextStyle(
                            fontSize: 22,
                            color: AppColors.main500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: "Rent",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Text(
                "Miaden Construction Shop",
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/icons/location_icon.svg',
                    width: 12.5,
                    height: 15,
                    fit: BoxFit.none,
                  ),
                  SizedBox(width: 6),
                  Text(
                    "742 Evergreen Terrace, Springfield",
                    style: TextStyle(
                      color: AppColors.grey300,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        PositionedDirectional(
          top: 25,
          start: 340,
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/favorite.svg',
              width: 30,
              height: 26.67,
              fit: BoxFit.none,
            ),
          ),
        ),
      ],
    );
  }
}
