// lib/features/authentication/ui/screens/reset_password_screen.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/common/widgets/elevated_button.dart';
import 'package:final_servixa/common/widgets/gradient.dart';
import 'package:final_servixa/common/widgets/text_field.dart'; // Assuming you have this widget
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/authentication/business-logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  final String code;

  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.code,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void handleResetPassword() {
    if (newPasswordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        backgroundColor: AppColors.red,
        colorText: AppColors.yellow,
      );
      return;
    }
    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar(
        'Error',
        'Passwords do not match',
        backgroundColor: AppColors.red,
        colorText: AppColors.yellow,
      );
      return;
    }

    authController.resetPassword(
      widget.email,
      widget.code,
      newPasswordController.text,
      (message) {
        Get.snackbar(
          'Success',
          message,
          backgroundColor: AppColors.main500,
          colorText: AppColors.yellow,
        );
        
      },
      (error) {
        Get.snackbar(
          'Error',
          error,
          backgroundColor: AppColors.red,
          colorText: AppColors.yellow,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGradient(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
              vertical: 32,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back, color: AppColors.grey600),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Center(
                  child: Text(
                    "reset_password_title".tr(), // "Reset Password"
                    style: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "reset_password_subtitle".tr(), // "Enter your new password"
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: AppColors.grey400,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                CustomFormField(
                  controller: newPasswordController,
                  width: MediaQuery.of(context).size.width * 0.93,
                  height: 48,
                  hint: "new_password".tr(),
                  inputAction: TextInputAction.next,
                  keyboard: TextInputType.text,
                  prefix: SvgPicture.asset(
                    'assets/icons/lock.svg',
                    width: 10,
                    height: 10,
                    fit: BoxFit.none,
                  ),
                  suffix: Obx(
                    () => IconButton(
                      onPressed: () {
                       authController.obscureNewPassword.value = !authController.obscureNewPassword.value;
                      },
                      icon: authController.obscureNewPassword.value
                          ? Icon(Icons.visibility_off)
                          : SvgPicture.asset(
                              'assets/icons/view.svg',
                              width: 22,
                              height: 22,
                              fit: BoxFit.none,
                            ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: AppColors.grey100),
                  ),
                  focused: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: AppColors.grey100),
                  ),
                  enabled: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: AppColors.grey100),
                  ),
                  obscuretext: authController.obscureNewPassword.value,
                ),
                SizedBox(height: 20),
                CustomFormField(
                  controller: confirmPasswordController,
                  width: MediaQuery.of(context).size.width * 0.93,
                  height: 48,
                  hint: "confirm_password".tr(),
                  inputAction: TextInputAction.done,
                  keyboard: TextInputType.text,
                  prefix: SvgPicture.asset(
                    'assets/icons/lock.svg',
                    width: 10,
                    height: 10,
                    fit: BoxFit.none,
                  ),
                  suffix: Obx(
                    () => IconButton(
                      onPressed: () {
                        authController.obscureConfirmPassword.value = !authController.obscureConfirmPassword.value;
                      },
                      icon: authController.obscureConfirmPassword.value
                          ? Icon(Icons.visibility_off)
                          : SvgPicture.asset(
                              'assets/icons/view.svg',
                              width: 22,
                              height: 22,
                              fit: BoxFit.none,
                            ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: AppColors.grey100),
                  ),
                  focused: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: AppColors.grey100),
                  ),
                  enabled: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: AppColors.grey100),
                  ),
                  obscuretext: authController.obscureConfirmPassword.value,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Obx(
                  () => authController.isloading.value
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.main500,
                          ),
                        )
                      : CustomElevated(
                          text: "reset_password_button".tr(), // "Reset Password"
                          height: 48,
                          width: MediaQuery.of(context).size.width * 0.93,
                          onPressed: handleResetPassword,
                          color: AppColors.main500,
                          background: AppColors.main500,
                          textColor: AppColors.yellow,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
