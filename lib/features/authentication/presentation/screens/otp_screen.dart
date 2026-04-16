import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/common/widgets/elevated_button.dart';
import 'package:final_servixa/common/widgets/gradient.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/authentication/business-logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatelessWidget {
   VerificationScreen({super.key,required this.email});

   AuthController authController = Get.find<AuthController>();
   TextEditingController otpController = TextEditingController();
   String email;
 String code = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGradient(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: AppColors.black),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),

              const SizedBox(height: 30),
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.mail_outline,
                  size: 40,
                  color: AppColors.main500,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "otp_title".tr(),
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "otp_subtitle $email".tr(),
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(color: AppColors.grey200),
              ),

              const SizedBox(height: 40),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 25,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    PinCodeTextField(
                      controller: otpController,
                      appContext: context,
                      length: 6,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.fade,
                      enableActiveFill: true,
                      cursorColor: AppColors.main500,
                      showCursor: false,

                      textStyle: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),

                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(12),
                        fieldHeight: 55,
                        fieldWidth: 45,
                        inactiveColor: AppColors.grey200,
                        inactiveFillColor: AppColors.grey50,

                        selectedColor: AppColors.main500,
                        selectedFillColor: AppColors.white,

                        activeColor: AppColors.main500,
                        activeFillColor: AppColors.white,
                      ),

                      onChanged: (value) {
                        code = value;
                      },
                    ),

                    const SizedBox(height: 20),

                   // Text(
                    //  "Resend code in 00:51",
                     // style: GoogleFonts.roboto(color: AppColors.grey200),
                  //  ),
                  ],
                ),
              ),
              const Spacer(),
              CustomElevated(
                   onPressed: () {
                  if (code.length != 6) {
                     Get.snackbar('Error', 'Enter full code');
                        return;
    }

              
                authController.verifyCode(
                  email,
                   code,
                        (msg) {
                          
        // روح على reset password screen أو location 
           Get.snackbar('Success', msg);},
      (err) {
        Get.snackbar('Error', err);
      },
    );
  },
   text: "Verify".tr(),
   background: AppColors.main500,
   height: 48,
   width: double.infinity,
   textColor: AppColors.yellow,
   color: AppColors.main500,
),
            ],
          ),
        ),
      ),
    );
  }
}
