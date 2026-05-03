import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_servixa/core/constants/app_colors.dart';

class FeaturesSection extends StatelessWidget {
  FeaturesSection({super.key});
  final List<Map<String, String>> features = [
    {'icon': 'assets/icons/balcony.svg', 'title': 'Balconies', 'status': 'Yes'},
    {'icon': 'assets/icons/bed.svg', 'title': 'Bedrooms', 'status': 'Yes'},
    {
      'icon': 'assets/icons/furnitures.svg',
      'title': 'Furnitures',
      'status': 'Yes',
    },
    {
      'icon': 'assets/icons/status.svg',
      'title': 'Status',
      'status': 'New Launch',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(16),
      margin: EdgeInsetsDirectional.only(top: 8),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About this item',
            style: GoogleFonts.roboto(
              fontStyle: FontStyle.normal,
              fontSize: 22,
              color: AppColors.main,
              fontWeight: FontWeight.w500,
            ),
          ),
         
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height:150,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: features.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing:16,
                childAspectRatio:4
              ),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 8,
                  children: [
                   SvgPicture.asset(features[index]['icon']!,width:22,height:22,fit: BoxFit.none,),
                   Text('${features[index]['title']}',
                    style: GoogleFonts.roboto(
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                    ),
                   ),
                   Text(': ${features[index]['status']}',
                    style: GoogleFonts.roboto(
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: AppColors.main500,
                      fontWeight: FontWeight.w400,
                    ),
                   ),
                    
                ]
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
