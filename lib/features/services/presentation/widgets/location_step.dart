import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/common/widgets/elevated_button.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/core/routing/app_router.dart';
import 'package:final_servixa/features/map/business-logic/controller/map_controller.dart';
import 'package:final_servixa/features/map/data/models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectLocationStep extends StatelessWidget {
  SelectLocationStep({super.key});
  final mapcontroller = Get.find<MapController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                  width: 101,
                  height: 101,
                  child: SvgPicture.asset(
                    'assets/icons/sub-categ-icon.svg',
                    fit: BoxFit.none,
                    width: 80,
                    height: 80,
                    alignment: AlignmentGeometry.topCenter,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'service_title_step4'.tr(),
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey700,
                  ),
                ),
        
                SizedBox(height: 24),
                Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/location_icon.svg',
                  width: 12.5,
                  height: 15,
                  fit: BoxFit.none,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                 mapcontroller.selectedLocation.value?.address ?? 'select_location'.tr(),
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey300,
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
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(18),
                          topLeft: Radius.circular(18),
                        ),
                        child: GetBuilder<MapController>(
                          builder: (controller) {
                            if (controller.isLoading.value) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            return GoogleMap(
                              initialCameraPosition:
                                  MapController.initialCameraPosition,

                              markers: controller.markers,

                              myLocationEnabled: true,

                              onMapCreated: (map) {
                                controller.mapController.value = map;
                              },

                              onTap: controller.selectLocation,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 12),

                    Center(
                      child: CustomElevated(
                        text: 'location'.tr(),
                        height: 48,
                        width: MediaQuery.of(context).size.width * 0.84,
                        onPressed: () async {
                          final result =
      await Get.toNamed(
    AppRouter.mapLocation,
  );

  if (result != null) {

  final location =
      result as LocationModel;

  mapcontroller.selectedLocation.value =
      location;

      location.address ?? '';

  mapcontroller.update();
}
  },
                        background: AppColors.white,
                        textColor: AppColors.main500,
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            
           
          ],
        ),
      ),
    );
  }
}
