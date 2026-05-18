import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/common/widgets/elevated_button.dart';
import 'package:final_servixa/common/widgets/gradient.dart';
import 'package:final_servixa/common/widgets/text_field.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/business-account/business-logic/controller/cities_controller.dart';
import 'package:final_servixa/features/business-account/data/models/cities_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_fonts/google_fonts.dart';

class UpdateProfileScreen extends StatelessWidget {
   UpdateProfileScreen({super.key});
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();

 final InputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: AppColors.grey100, width: 1),
  );

  final CitiesController citiesController = Get.put(CitiesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomGradient(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.grey700,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Update ",
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey800,
                        ),
                      ),
                      Text(
                        "Profile ",
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.main500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        child: CustomFormField(
                          width: MediaQuery.of(context).size.width * 0.44,
                          height: 48,
                          hint: 'Name Arabic ',
                          prefix: SvgPicture.asset(
                            'assets/icons/person_icon.svg',
                            width: 13.5,
                            height: 15.75,
                            fit: BoxFit.none,
                          ),
                          inputAction: TextInputAction.next,
                          keyboard: TextInputType.name,
                          border: border,
                          focused: border,
                          enabled: border,
                          obscuretext: false,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: CustomFormField(
                          width: MediaQuery.of(context).size.width * 0.44,
                          height: 48,
                          hint: 'Name English',
                          prefix: SvgPicture.asset(
                            'assets/icons/person_icon.svg',
                            width: 13.5,
                            height: 15.75,
                            fit: BoxFit.none,
                          ),
                          inputAction: TextInputAction.next,
                          keyboard: TextInputType.name,
                          border: border,
                          focused: border,
                          enabled: border,
                          obscuretext: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),

                  CustomFormField(
                    width: MediaQuery.of(context).size.width * 0.91,
                    height: 48,
                    hint: 'Email Address',
                    prefix: SvgPicture.asset(
                      'assets/icons/message.svg',
                      width: 14.25,
                      height: 14.41,
                      fit: BoxFit.none,
                    ),
                    inputAction: TextInputAction.next,
                    keyboard: TextInputType.emailAddress,
                    border: border,
                    focused: border,
                    enabled: border,
                    obscuretext: false,
                  ),

                  SizedBox(height: 24),

                  CustomFormField(
                    width: MediaQuery.of(context).size.width * 0.91,
                    height: 48,
                    hint: 'Phone Number',
                    prefix: SvgPicture.asset(
                      'assets/icons/phone-icon.svg',
                      width: 15.44,
                      height: 14.65,
                      fit: BoxFit.none,
                    ),
                    inputAction: TextInputAction.next,
                    keyboard: TextInputType.phone,
                    border: border,
                    focused: border,
                    enabled: border,
                    obscuretext: false,
                  ),
                  SizedBox(height: 24),
                   Obx(() {
              if (citiesController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.main500,
                    strokeWidth:5,
                  ),
                );
              }
              return Container(
                width: MediaQuery.of(context).size.width * 0.91,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: DropdownButtonFormField<CityModel>(
                  initialValue: citiesController.selectedCity.value,
                  decoration: InputDecoration(
                    hintText: 'city'.tr(),
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey800,
                    ),
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.main500,
                      size: 25,
                    ),

                    prefixIcon: SvgPicture.asset(
                      'assets/icons/cities.svg',
                      width: 18,
                      height: 18,
                      fit: BoxFit.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  items: citiesController.cities.map((city) {
                    return DropdownMenuItem<CityModel>(
                      value: city,
                      child: Text(
                        city.cityName,
                        style: GoogleFonts.roboto(
                       fontSize: 14,
                       fontWeight: FontWeight.w400,
                        color: AppColors.grey800,
            ),
                        ),
                    );
                  }).toList(),

                  onChanged: (value) {
                    log(value!.cityName + value.id.toString());
                 citiesController.selectedCity.value = value;

                  },
                ),
              );
            }),

                  SizedBox(height: 24),

                  CustomFormField(
                    width: MediaQuery.of(context).size.width * 0.91,
                    height: 158,
                    maxLines: 6,
                    prefixConstraints: BoxConstraints(
                      minWidth: 40,
                      minHeight: 40,
                      maxHeight: 40,
                      maxWidth: 40,
                    ),
                    prefix: Align(
                      alignment: AlignmentGeometry.directional(0, -4.5),
                      child: SvgPicture.asset(
                        'assets/icons/adress.svg',
                        width: 18,
                        height: 18,
                        fit: BoxFit.none,
                      ),
                    ),
                    hint: 'Address Detail',
                    inputAction: TextInputAction.next,
                    keyboard: TextInputType.text,
                    border: border,
                    focused: border,
                    enabled: border,
                    obscuretext: false,
                  ),

                  SizedBox(height: 24),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/location_icon.svg',
                        width: 12.5,
                        height: 15,
                      ),

                      const SizedBox(width: 6),

                      Expanded(
                        child: Text(
                          '742 Evergreen Terrace, Springfield',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: AppColors.grey300,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),

                  Card(
                    color: AppColors.white,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.34,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(18),
                                topLeft: Radius.circular(18),
                              ),
                              child: Image.asset(
                                'assets/images/map.png',
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),

                          SizedBox(height: 12),

                          Center(
                            child: CustomElevated(
                              text: 'location'.tr(),
                              height: 48,
                              width: MediaQuery.of(context).size.width * 0.84,
                              onPressed: () {},
                              background: AppColors.white,
                              textColor: AppColors.main500,
                            ),
                          ),

                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  CustomElevated(
                    text: 'Upload picture',
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.91,
                    onPressed: () {},
                    background: AppColors.white,
                    textColor: AppColors.main500,
                  ),

                  SizedBox(height: 24),

                  CustomElevated(
                    text: 'Update',
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.91,
                    onPressed: () {},
                    background: AppColors.main500,
                    textColor: AppColors.yellow,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
