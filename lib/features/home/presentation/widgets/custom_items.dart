import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
    this.width,
    required this.image,
    required this.location,
    required this.price,
    required this.title,
  });

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
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color:AppColors.shadowb,
              blurRadius: 7,
              offset: Offset(1, 1),
              
            )
          ],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.grey50,width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 126,
                fit: BoxFit.cover,
              ),
            ),

           
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),

                    // const SizedBox(height:4),

                    
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location_icon.svg',
                          width: 10,
                          height: 12,
                        ),
                        const SizedBox(width: 3),
                        Expanded(
                          child: Text(
                            location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey300,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // SizedBox(height:4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$price SAK',
                          style: const TextStyle(
                            color: AppColors.main500,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            size: 20,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
