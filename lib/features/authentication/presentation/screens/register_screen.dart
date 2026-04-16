import 'dart:developer';
import 'package:final_servixa/common/widgets/gradient.dart';
import 'package:final_servixa/common/widgets/text_field.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/authentication/business-logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/routing/app_router.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscure = false;
 AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGradient(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 32,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: MediaQuery.of(context).size.height * 0.020,
              children: [
                    Align(
                      alignment:AlignmentGeometry.topRight,
                      child: TextButton(
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
                    ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'title1'.tr(),
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
                    'reg-subtitle'.tr(),
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey400,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomFormField(
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: 48,
                      hint:'first'.tr(),
                      inputAction: TextInputAction.next,
                      keyboard: TextInputType.name,
                      prefix: SvgPicture.asset(
                        'assets/icons/person_icon.svg',
                        width: 18,
                        height: 18,
                        fit: BoxFit.none,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: AppColors.grey100,
                          width: 1,
                        ),
                      ),
                      focused: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: AppColors.grey100,
                          width: 1,
                        ),
                      ),
                      enabled: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: AppColors.grey100,
                          width: 1,
                        ),
                      ),
                      obscuretext: false,
                    ),
                    CustomFormField(
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: 48,
                      hint:'last'.tr(),
                      inputAction: TextInputAction.next,
                      keyboard: TextInputType.name,
                      prefix: SvgPicture.asset(
                        'assets/icons/person_icon.svg',
                        width: 18,
                        height: 18,
                        fit: BoxFit.none,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: AppColors.grey100,
                          width: 1,
                        ),
                      ),
                      focused: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: AppColors.grey100,
                          width: 1,
                        ),
                      ),
                      enabled: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: AppColors.grey100,
                          width: 1,
                        ),
                      ),
                      obscuretext: false,
                    ),
                  ],
                ),
                CustomFormField(
                  width: MediaQuery.of(context).size.width * 0.93,
                  height: 48,
                  hint:'phone-reg'.tr(),
                  inputAction: TextInputAction.next,
                  keyboard: TextInputType.text,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: AppColors.grey100, width: 1),
                  ),
                  focused: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: AppColors.grey100, width: 1),
                  ),
                  enabled: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: AppColors.grey100, width: 1),
                  ),
                  obscuretext: false,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.93,
                  height: 48,
                  child: IntlPhoneField(
                    disableLengthCheck: true,
                    initialCountryCode: 'Syria',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey800,
                    ),
                    dropdownIconPosition: IconPosition.trailing,

                    dropdownTextStyle: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    flagsButtonPadding: const EdgeInsets.only(
                      left: 10,
                      right: 6,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.grey100,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.grey100,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.grey100,
                          width: 1.5,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      log(value.completeNumber);
                    },
                  ),
                ),
                CustomFormField(
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
                CustomFormField(
                  width: MediaQuery.of(context).size.width * 0.93,
                  height: 48,
                  hint:'confirm'.tr(),
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
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        activeColor: Colors.green,
                        value: controller.checked.value,
                        onChanged: (value) {
                          controller.checked.value = value!;
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
                      Text(
                        'terms'.tr(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.main500,
                        ),
                      ),
                    ],
                  );
                }),
                Obx(() {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.93,
                    height: 48,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          controller.checked.value
                              ? AppColors.main500
                              : AppColors.grey300,
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.all(
                              Radius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      onPressed: controller.checked.value
                          ? () {
                              Get.toNamed(AppRouter.otp);
                            }
                          : null,
                      child: Text(
                        'register'.tr(),
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.yellow,
                        ),
                      ),
                    ),
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      'already-have'.tr(),
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRouter.login);
                      },
                      child: Text(
                        'login'.tr(),
                        style: GoogleFonts.roboto(
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
