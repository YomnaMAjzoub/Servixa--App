import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/business-account/business-logic/controller/business_acc_controller.dart';
import 'package:final_servixa/features/business-account/presentation/widgets/file_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_fonts/google_fonts.dart';
import 'package:open_filex/open_filex.dart';

class SelectDocumentsScreen extends StatelessWidget {
  SelectDocumentsScreen({super.key});

  final BusinessAccountController controller = Get.put(
    BusinessAccountController(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
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
              ),
              SizedBox(height: 24),
              Center(
                child: Text(
                  'business_title4'.tr(),
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey700,
                  ),
                ),
              ),

              SizedBox(height: 24),

              Text(
                'support'.tr(),
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey600,
                ),
              ),

              SizedBox(height: 16),

              Column(
                children: controller.uploadedFiles.map((file) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: UploadFileCard(
                      name: file.name,
                      size: file.size,
                      isPdf: file.isPdf,
                      onView: () {
                        OpenFilex.open(file.path);
                      },
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),

              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.91,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        side: BorderSide(width: 1, color: AppColors.main500),
                      ),
                    ),
                    onPressed:controller.pickPdf,
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/pdf-icon.svg',
                          width: 15.42,
                          height: 18.5,
                          fit: BoxFit.none,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'upload_doc'.tr(),
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.main500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.91,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        side: BorderSide(width: 1, color: AppColors.main500),
                      ),
                    ),
                    onPressed: 
                      controller.pickImage,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/camera-icon.svg',
                          width: 22,
                          height: 19,
                          fit: BoxFit.none,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'upload_imag'.tr(),
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.main500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
