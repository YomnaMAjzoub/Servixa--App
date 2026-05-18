import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/services/business-logic/controllers/service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart'hide Trans;
import 'package:google_fonts/google_fonts.dart';

class AdDetailsStep extends StatelessWidget {
   AdDetailsStep({super.key});
  final controller=Get.find<ServiceController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                    width: 101,
                    height: 101,
                    child: SvgPicture.asset(
                      'assets/icons/ad-details-icon.svg',
                      fit: BoxFit.none,
                      width: 80,
                      height: 80,
                      alignment: AlignmentGeometry.topCenter,
                    ),
                  ),
            ),
                SizedBox(height: 24),
                Center(
                  child: Text(
                    'service_title_step3'.tr(),
                    style: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey700,
                    ),
                  ),
                ),
        
                SizedBox(height: 24),



               Center(
                 child:Obx(
                         () {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Checkbox( 
                               activeColor: Colors.green, 
                              checkColor: AppColors.white,
                              value: controller.agreeToTerms.value,
                              onChanged: (value) {
                                controller.agreeToTerms.value = value!;
                              },
                            ),
                            Text(
                                'agree'.tr(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.snackbar('Info', 'Terms and Conditions page coming soon!');
                                    
                                },
                                child :Text('terms'.tr(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.main500,
                                ),
                                ),
                              ),
                            ],
                          );
                        }
                      ),
                      
               ),
                
           
          ],

      ),
      ),
    );
  }
}
