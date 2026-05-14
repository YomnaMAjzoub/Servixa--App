import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:final_servixa/features/business-account/data/models/uploaded_file_model.dart';
import 'package:final_servixa/features/business-account/data/src/business_acc_service.dart';
import 'package:final_servixa/features/map/business-logic/controller/map_controller.dart';
import 'package:final_servixa/features/map/data/models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BusinessAccountController extends GetxController {
  RxBool isloading = false.obs;
  final BusinessAccService accService = BusinessAccService();
  final PageController pageController = PageController();
  final RxInt currentIndex = 0.obs;
  final uploadedFiles = <UploadedFileModel>[].obs;

  final MapController mapController = Get.find<MapController>();

  LocationModel? get location => mapController.selectedLocation.value;

  final TextEditingController
    businessNameArController =
        TextEditingController();

final TextEditingController
    businessNameEnController =
        TextEditingController();

final TextEditingController
    licenseNumberController =
        TextEditingController();

final TextEditingController
    businessAddressController =
        TextEditingController();

final TextEditingController
    activitiesController =
        TextEditingController();

final TextEditingController
    detailsController =
        TextEditingController();


        @override
void onClose() {

  pageController.dispose();

  businessNameArController.dispose();

  businessNameEnController.dispose();

  licenseNumberController.dispose();

  businessAddressController.dispose();

  activitiesController.dispose();

  detailsController.dispose();

  super.onClose();
}

  void nextPage() {
    if (currentIndex.value < 3) {
      currentIndex.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  RxInt selectedUserTypeId = 0.obs;

RxInt selectedCityId = 0.obs;

RxInt selectedAccountType = 0.obs;

  void previousPage() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void jumpToPage(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  /// Upload PDF
 Future<void> pickPdf() async {

  final result = await FilePicker.pickFiles(

    type: FileType.custom,

    allowedExtensions: ['pdf'],
  );

  if (result != null) {

    final file = result.files.first;

    uploadedFiles.add(

      UploadedFileModel(

        name: file.name,

        path: file.path!,

        isPdf: true,

        size: file.size /
            (1024 * 1024),
      ),
    );
  }
}

  /// Upload Image
  Future<void> pickImage() async {

  final picker = ImagePicker();

  final image = await picker.pickImage(

    source: ImageSource.gallery,

    imageQuality: 100,
  );

  if (image != null) {

    final bytes =
        await image.length();

    uploadedFiles.add(

      UploadedFileModel(

        name: image.name,

        path: image.path,

        isPdf: false,

        size: bytes /
            (1024 * 1024),
      ),
    );
  }
}

  Future<void> submitBusiness() async {

  try {

    if (location == null) {

      Get.snackbar(
        "Error",
        "Please select location",
      );

      return;
    }

    if (uploadedFiles.isEmpty) {

      Get.snackbar(
        "Error",
        "Please upload documents",
      );

      return;
    }

    isloading.value = true;

    final result =
        await accService
            .createBusinessAccount(

      userTypeId:
          selectedUserTypeId.value,

      cityId:
          selectedCityId.value,

      accountType:
          selectedAccountType.value,

      businessNameAr:
          businessNameArController.text,

      businessNameEn:
          businessNameEnController.text,

      licenseNumber:
          licenseNumberController.text,

      businessAddress:
          businessAddressController.text,

      activities:
          activitiesController.text,

      details:
          detailsController.text,

      lat:
          location!.lat,

      lng:
          location!.lng,

      documents:
          uploadedFiles.map(

        (e) =>
            File(e.path),

      ).toList(),
    );

    Get.snackbar(
      "Success",
      "Business account created",
    );

    log(result.id.toString());

  } catch (e) {

    Get.snackbar(
      "Error",
      e.toString(),
    );

  } finally {

    isloading.value = false;
  }
}
}
