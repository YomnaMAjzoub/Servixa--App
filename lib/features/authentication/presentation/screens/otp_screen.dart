// lib/features/authentication/ui/screens/otp_screen.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/common/widgets/elevated_button.dart';
import 'package:final_servixa/common/widgets/gradient.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/core/routing/app_router.dart'; // Import AppRouter
import 'package:final_servixa/features/authentication/business-logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({
    super.key,
    required this.email,
    required this.isRegister,
  });

  AuthController authController = Get.find<AuthController>();
  TextEditingController otpController = TextEditingController();
  String email;
  String code = '';
  final bool isRegister;

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
                isRegister ? "verify_email_title".tr() : "otp_title".tr(), // Different titles for clarity
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
               "${isRegister ? "verify_email_subtitle".tr() : "otp_subtitle".tr()} $email",
                textAlign: TextAlign.center,
                maxLines: 2,
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
                    //   "Resend code in 00:51",
                    //   style: GoogleFonts.roboto(color: AppColors.grey200),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Obx(
                () => authController.isloading.value
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.main500,
                        ),
                      )
                    : CustomElevated(
                        onPressed: () {
                          if (code.length != 6) {
                            Get.snackbar('Error', 'Enter full code');
                            return;
                          }
                          if (isRegister) {
                          authController.verifyEmail(
                           email,
                              code,
                              (msg) {
                                Get.snackbar('Success', msg);
                                // After successful email verification, navigate to login
                                Get.offAllNamed(AppRouter.login);
                              },
                              (err) {
                                Get.snackbar('Error', err);
                              },
                            );
                          } else {
                            // 🔥 forgot password
                            authController.verifyCode(
                              email,
                              code,
                              (msg) {
                                Get.snackbar('Success', msg);
                                // Navigate to reset password screen after successful verification
                                Get.toNamed(AppRouter.resetPassword,
                                    arguments: {'email': email, 'code': code});
                              },
                              (err) {
                                Get.snackbar('Error', err);
                              },
                            );
                          }
                        },
                        text: "Verify".tr(),
                        background: AppColors.main500,
                        height: 48,
                        width: MediaQuery.of(context).size.width * 0.50,
                        textColor: AppColors.yellow,
                        color: AppColors.main500,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

