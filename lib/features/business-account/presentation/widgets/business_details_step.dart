import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/common/widgets/text_field.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/business-account/business-logic/controller/business_acc_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart'hide Trans;
import 'package:google_fonts/google_fonts.dart';

class BusinessDetailsScreen extends StatelessWidget {
  BusinessDetailsScreen({super.key});
  final businessController =Get.find<BusinessAccountController>();

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
                  'assets/images/detail-image.svg',
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
                'business_title2'.tr(),
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey700,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'business_label1'.tr(),
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grey600,
              ),
              ),

              SizedBox(height:12),

            CustomFormField(
              controller: businessController.licenseNumberController,
            width: MediaQuery.of(context).size.width*0.91,
             height:48,
              hint: 'business_hint1'.tr(),
              prefix: SvgPicture.asset('assets/icons/license-icon.svg',width:10.8,height: 14.4,fit: BoxFit.none),
               inputAction: TextInputAction.next,
                keyboard:TextInputType.number,
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.grey100,width: 1),
                 ),
                  focused:OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                   borderSide: BorderSide(color: AppColors.grey100,width: 1)),
                    enabled:OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                     borderSide: BorderSide(color: AppColors.grey100,width: 1)),
                     obscuretext: false,
                 ),
                 SizedBox(height: 24),

                 Text(
              'business_label2'.tr(),
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grey600,
              ),
              ),
              SizedBox(height:12),
            CustomFormField(
            controller: businessController.businessNameArController,
            width: MediaQuery.of(context).size.width*0.91,
             height:48,
              hint: 'business_hint2'.tr(),
              prefix: SvgPicture.asset('assets/icons/name-icon.svg',width:10.8,height: 14.4,fit: BoxFit.none),
               inputAction: TextInputAction.next,
                keyboard:TextInputType.text,
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.grey100,width: 1),
                 ),
                  focused:OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                   borderSide: BorderSide(color: AppColors.grey100,width: 1)),
                    enabled:OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                     borderSide: BorderSide(color: AppColors.grey100,width: 1)),
                     obscuretext: false,
                 ),

                 SizedBox(height: 24),

                 Text(
              'business_label3'.tr(),
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grey600,
              ),
              ),
              SizedBox(height:12),
            CustomFormField(
              controller: businessController.businessNameEnController,
            width: MediaQuery.of(context).size.width*0.91,
             height:48,
              hint: 'business_hint2'.tr(),
              prefix: SvgPicture.asset('assets/icons/name-icon.svg',width:10.8,height: 14.4,fit: BoxFit.none),
               inputAction: TextInputAction.next,
                keyboard:TextInputType.text,
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.grey100,width: 1),
                 ),
                  focused:OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                   borderSide: BorderSide(color: AppColors.grey100,width: 1)),
                    enabled:OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                     borderSide: BorderSide(color: AppColors.grey100,width: 1)),
                     obscuretext: false,
                 ),

                 SizedBox(height: 24),

                 Text(
              'business_label4'.tr(),
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grey600,
              ),
              ),
              SizedBox(height:12),
            CustomFormField(
              controller: businessController.activitiesController,
              width: MediaQuery.of(context).size.width*0.91,
             height:48,
              hint: 'business_hint4'.tr(),
              prefix: SvgPicture.asset('assets/icons/activity-icon.svg',width:10.8,height: 14.4,fit: BoxFit.none),
               inputAction: TextInputAction.next,
                keyboard:TextInputType.text,
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.grey100,width: 1),
                 ),
                  focused:OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                   borderSide: BorderSide(color: AppColors.grey100,width: 1)),
                    enabled:OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                     borderSide: BorderSide(color: AppColors.grey100,width: 1)),
                     obscuretext: false,
                 ),
                 SizedBox(height: 24),

                 Text(
              'business_label5'.tr(),
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grey600,
              ),
              ),
              SizedBox(height:12),
            CustomFormField(
              controller: businessController.detailsController,
              width: MediaQuery.of(context).size.width*0.91,
              height:MediaQuery.of(context).size.height*0.12,
              prefixConstraints: BoxConstraints(minWidth: 40, minHeight: 40,maxHeight:40,maxWidth:40),
              hint: 'business_hint4'.tr(),
              prefix: Align(
                alignment: AlignmentGeometry.directional(0,-2.2),
                child: SvgPicture.asset('assets/icons/activity-icon.svg',width:18,height: 18,fit: BoxFit.none)),
               inputAction: TextInputAction.next,
                keyboard:TextInputType.text,
                 maxLines: 6,
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.grey100,width: 1),
                 ),
                  focused:OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                   borderSide: BorderSide(color: AppColors.grey100,width: 1)),
                    enabled:OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                     borderSide: BorderSide(color: AppColors.grey100,width: 1)),
                     obscuretext: false,
                 ),
                 SizedBox(height:20),
     
        ],
      ),
    ));
  }
}