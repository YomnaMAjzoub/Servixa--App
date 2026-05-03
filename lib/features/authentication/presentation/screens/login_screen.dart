import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/common/widgets/elevated_button.dart';
import 'package:final_servixa/common/widgets/gradient.dart';
import 'package:final_servixa/common/widgets/text_field.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/core/routing/app_router.dart';
import 'package:final_servixa/features/authentication/business-logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.put(AuthController());

   @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleLogin() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        backgroundColor: AppColors.red,
        colorText: AppColors.yellow,
      );
      return;
    }

    authController.login(
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
      emailController.text.trim(),
      passwordController.text.trim(),
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
              spacing: MediaQuery.of(context).size.height * 0.020,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.toNamed(AppRouter.register);
                      },
                      icon: Icon(Icons.arrow_back, color: AppColors.grey600),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                          Get.offNamed(AppRouter.main);
                      },
                      child: Text(
                        "skip".tr(),
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.main500,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.024),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.67,
                    height: MediaQuery.of(context).size.height * 0.087,
                    child: Image.asset(
                      height: MediaQuery.of(context).size.height * 0.087,
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'title'.tr(),
                      style: GoogleFonts.roboto(
                        fontSize: 34,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey700,
                      ),
                    ),
                    Text(
                      'title2'.tr(),
                      style: GoogleFonts.roboto(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                        color: AppColors.main500,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    'subtitle'.tr(),
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey400,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.016),
                CustomFormField(
                  controller: emailController,
                  width: MediaQuery.of(context).size.width * 0.93,
                  height: 48,
                  hint: "email".tr(),
                  inputAction: TextInputAction.next,
                  keyboard: TextInputType.emailAddress,
                  obscuretext: false,
                  prefix: SvgPicture.asset(
                    'assets/icons/email_icon.svg',
                    width: 10,
                    height: 10,
                    fit: BoxFit.none,
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
                ),
                CustomFormField(
                  controller: passwordController,
                  width: MediaQuery.of(context).size.width * 0.93,
                  height: 48,
                  hint:'pass'.tr(),
                  inputAction: TextInputAction.done,
                  keyboard: TextInputType.text,
                  prefix: SvgPicture.asset(
                    'assets/icons/lock.svg',
                    width: 10,
                    height: 10,
                    fit: BoxFit.none,
                  ),
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    icon: obscure
                        ? Icon(Icons.visibility_off)
                        : SvgPicture.asset(
                            'assets/icons/view.svg',
                            width: 22,
                            height: 22,
                            fit: BoxFit.none,
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
                  obscuretext: obscure,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                   onPressed: () {
                      if (emailController.text.isEmpty) {
                        Get.snackbar('Error', 'Enter your email first');
                        return;
                      }
                  
                      authController.forgetPassword(
                        emailController.text,
                        (msg) {
                          Get.toNamed(AppRouter.otp, arguments: {'email': emailController.text});
                        },
                        (err) {
                          Get.snackbar('Error', err);
                        },
                      );
                    },
                          child: Text('forgot_pass'.tr(),
                          style: GoogleFonts.roboto(fontSize:14,fontWeight: FontWeight.w500,color: AppColors.grey600))),
                ),
                //SizedBox(height: MediaQuery.of(context).size.height * 0.014),
             Obx(
                   () {
                    return authController.isloading.value?Center(child: CircularProgressIndicator(color: AppColors.main500,))
                    :CustomElevated(
                      text:'login'.tr(),
                      height: 48,
                      width: MediaQuery.of(context).size.width * 0.93,
                      onPressed: () {
                        authController.login(
                          (message) {
                            Get.snackbar('Success', message,dismissDirection: DismissDirection.up,duration: Duration(seconds:2),backgroundColor:AppColors.main500,colorText: AppColors.yellow);
                          },
                          (error) {
                            Get.snackbar('Error', error,dismissDirection: DismissDirection.up,duration: Duration(seconds:2),backgroundColor: AppColors.red,colorText: AppColors.yellow);
                          },
                          emailController.text,
                          passwordController.text
                        );
                      },
                      color: AppColors.main500,
                      background: AppColors.main500,
                      textColor: AppColors.yellow,
                    );
                  }
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      StringTranslateExtension('ques-login').tr(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offNamed(AppRouter.register);
                      },
                      child: Text(
                        StringTranslateExtension('register').tr(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.main500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
