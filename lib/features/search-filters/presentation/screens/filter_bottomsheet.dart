import 'package:final_servixa/common/widgets/text_field.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/search-filters/business-logic/controller/filters_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';


class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  final FilterController controller = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filters',
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey700,
                ),
              ),
              //   SizedBox(height:32,),
              TextButton(
                onPressed: () {
                  controller.resetFilters();
                },
                child: Text(
                  'Reset',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.main500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () {
                  return Checkbox(
                    activeColor: Colors.green,
                    value: controller.locationCheck.value,
                    onChanged: (value) {
                      controller.locationCheck.value = value!;
                    },
                  );
                }
              ),
              Text(
                'Location',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              SizedBox(width: 8),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/location_icon.svg',
                  width: 15,
                  height: 18,
                  fit: BoxFit.none,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Obx(
            () {
              return CustomFormField(
                enable: controller.locationCheck.value,
                
                controller: controller.locationController,
                width: MediaQuery.of(context).size.width * 0.9,
                height: 48,
                hint: 'location',
                inputAction: TextInputAction.next,
                keyboard: TextInputType.text,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: AppColors.grey100),
                ),
                focused: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: AppColors.main500),
                ),
                enabled: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: AppColors.grey100),
                ),
                obscuretext: false,
              );
            }
          ),
          SizedBox(height: 24),
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () {
                  return Checkbox(
                    activeColor: Colors.green,
                    value: controller.categoryCheck.value,
                    onChanged: (value) {
                      controller.categoryCheck.value = value!;
                    },
                  );
                }
              ),
              Text(
                'Category',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
