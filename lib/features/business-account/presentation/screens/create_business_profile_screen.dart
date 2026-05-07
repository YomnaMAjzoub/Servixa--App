import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/common/widgets/elevated_button.dart';
import 'package:final_servixa/common/widgets/gradient.dart';
import 'package:final_servixa/core/constants/app_colors.dart' ;
import 'package:final_servixa/features/business-account/business-logic/controller/business_acc_controller.dart';
import 'package:final_servixa/features/business-account/presentation/widgets/business_details_step.dart';
import 'package:final_servixa/features/business-account/presentation/widgets/profile_type_step.dart';
import 'package:final_servixa/features/business-account/presentation/widgets/select_contactinfo_step.dart';
import 'package:final_servixa/features/business-account/presentation/widgets/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'hide Trans;

class BusinessProfileScreen extends StatelessWidget {
  BusinessProfileScreen({super.key});

  final BusinessAccountController controller = Get.put(
    BusinessAccountController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGradient(
        child: SafeArea(
            child: Column(
              children: [
                Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 22.05,
                        color: AppColors.grey700,
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 14, vertical: 24),
                  child:Obx(
                  () {
                      return StepIndicator(currentStep: controller.currentIndex.value);
                    }
                  ) ,
                  ),
                  SizedBox(height: 20),

                  Expanded(
                    child: PageView(
                      controller: controller.pageController,
                      onPageChanged: controller.jumpToPage,
                      physics: BouncingScrollPhysics(),
                      children: [
                        SelectProfileTypeScreen(),
                        BusinessDetailsScreen(),
                        ContactInfoScreen(),
                       
                      ],
                  ),
                  ),
             Padding(
              padding:  EdgeInsets.all(16),
              child: Obx(() {
                final isLast = controller.currentIndex.value == 4;

                return Row(
                  children: [
                   
                    if (controller.currentIndex.value > 0)
                      Expanded(
                        child: CustomElevated(
                          text: 'previous'.tr(),
                          height: 48,
                          width: double.infinity,
                          onPressed: controller.previousPage,
                          background: AppColors.white,
                          textColor: AppColors.main500,
                        ),
                      ),

                    if (controller.currentIndex.value > 0)
                      const SizedBox(width: 12),

                  
                    Expanded(
                      child: CustomElevated(
                        text: isLast ? "submit".tr() : "next".tr(),
                        height: 48,
                        width: double.infinity,
                        onPressed: () {
                          if (isLast) {
                           
                          } else {
                            controller.nextPage();
                          }
                        },
                        background: AppColors.main500,
                        textColor: AppColors.yellow,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
