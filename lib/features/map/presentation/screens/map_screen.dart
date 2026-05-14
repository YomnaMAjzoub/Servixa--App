import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/map/business-logic/controller/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});

  final controller = Get.find<MapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MapController>(
        init: controller,
        builder: (c) {
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition:
                    MapController.initialCameraPosition,
                markers: c.markers,
                onMapCreated: (map) {
                  c.mapController.value = map;
                },
                onTap: c.selectLocation,
              ),

              Positioned(
                bottom: 24,
                left: 16,
                right: 16,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.main500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                  onPressed: () {
                    Get.back(result: c.selectedLocation.value);
                  },
                  child:  Text(
                    "Confirm",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.yellow
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}