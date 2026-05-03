import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    this.width,
    required this.image,
    required this.location,
    required this.price,
    required this.title,
    super.key});

  final double? width;
  final String image;
  final String title;
  final String location;
  final num price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRouter.product);
      },
      child: Container(
        width: width,
        height: MediaQuery.of(context).size.height*0.126,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(33),
          border: Border.all(color: AppColors.grey50, width: 1),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowb,
              blurRadius: 7,
              offset: const Offset(1, 1),
            )
          ],
        ),

       
        child: Row(
          children: [

           
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: 99,
                height: 95,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),

            const SizedBox(width: 16),

            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),

                  const SizedBox(height:6),

                  
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/location_icon.svg',
                        width: 10,
                        height: 12,
                        fit: BoxFit.none,
                      ),

                      const SizedBox(width:3),

                      Expanded(
                        child: Text(
                          location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey300,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  
                  SizedBox(
                    height: 24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$price SAK',
                          style: GoogleFonts.roboto(
                            color: AppColors.main500,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                      onPressed: () {},
                       icon: const Icon(
                                    Icons.favorite_border,
                                    color:AppColors.black,
                                    size: 22,
                                  ),
                                ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

           
            
          ],
        ),
      ),
    );
  }
}