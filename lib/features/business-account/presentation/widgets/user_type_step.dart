import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/business-account/business-logic/controller/business_acc_controller.dart';
import 'package:final_servixa/features/business-account/business-logic/controller/user_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_fonts/google_fonts.dart';

class SelectUserTypeScreen extends StatelessWidget {
  SelectUserTypeScreen({super.key});

  final UserTypeController userTypeController = Get.put(UserTypeController(),permanent: true);
  final businessController =
    Get.find<BusinessAccountController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: Obx(() {
        if (userTypeController.isloading.value) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.main500),
          );
        }
        return SingleChildScrollView(
         
          child: Column(
            children: [
              SizedBox(
                width: 101,
                height: 101,
                child: SvgPicture.asset(
                  'assets/images/type-image.svg',
                  fit: BoxFit.none,
                  width: 80,
                  height: 80,
                  alignment: AlignmentGeometry.topCenter,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'business_title1'.tr(),
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey700,
                ),
              ),

              SizedBox(height: 24),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.91,
                height: MediaQuery.of(context).size.height * 0.54,
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: userTypeController.user.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                         final item = userTypeController.user[index];
                   businessController.selectedUserTypeId.value = item.id;                            
                  log(businessController.selectedUserTypeId.value.toString());
                      },
                      child: Container(
                        padding: EdgeInsetsDirectional.all(10),
                        margin: EdgeInsetsDirectional.all(7),
                        width: MediaQuery.of(context).size.width * 0.42,
                        height: MediaQuery.of(context).size.height * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color:businessController.selectedUserTypeId.value ==userTypeController.user[index].id
                           ? AppColors.main500
                          : AppColors.yellow,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(
                              userTypeController.user[index].icon!.url,
                              width: 49.7,
                              height: 50.1,
                              fit: BoxFit.none,
                              errorBuilder: (context, error, stackTrace) {
                                 return Icon(
                                     Icons.broken_image,
                                  color: AppColors.grey100,
                                           size: 40,
                                );
                             },
                          ),
                            Text(
                              userTypeController.user[index].name,
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
