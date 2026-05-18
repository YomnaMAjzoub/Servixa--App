import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/common/widgets/elevated_button.dart';
import 'package:final_servixa/common/widgets/gradient.dart';
import 'package:final_servixa/common/widgets/step_indicator.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/services/business-logic/controllers/service_controller.dart';
import 'package:final_servixa/features/services/presentation/widgets/location_step.dart';
import 'package:final_servixa/features/services/presentation/widgets/select_category_step.dart';
import 'package:final_servixa/features/services/presentation/widgets/select_subcategory_step.dart';
import 'package:final_servixa/features/services/presentation/widgets/write_details_step.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'hide Trans;


class AddServiceScreen extends StatelessWidget {
   AddServiceScreen({super.key});
   final ServiceController controller=Get.put(ServiceController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGradient(
        child:SafeArea(
          child: Column(
            children:[
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
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 14,
                  vertical: 24,
                ),
                child: Obx(
                  () {
                    return StepIndicator(
                      currentStep: controller.currentIndex.value,
                    );
                  }
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  physics:NeverScrollableScrollPhysics() ,
                  children: [
                   SelectCategoryStep(),
                   SelectSubCategoryStep(),
                   AdDetailsStep(),
                   SelectLocationStep()
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Obx(() {
                  final isLast = controller.currentIndex.value == 3;

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
                          text:controller.isloading.value
                          ?"Loading...."
                          : isLast ? "submit".tr() : "next".tr(),
                          height: 48,
                          width: double.infinity,
                          onPressed: 
                          controller.isloading.value
                          ? null
                          : () {
                            if (isLast) {
                             // controller.submitBusiness();
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
