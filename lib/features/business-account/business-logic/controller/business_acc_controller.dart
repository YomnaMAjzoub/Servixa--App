import 'package:file_picker/file_picker.dart';
import 'package:final_servixa/features/business-account/data/models/uploaded_file_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BusinessAccountController extends GetxController {

  final PageController pageController = PageController();
  final RxInt currentIndex = 0.obs;
  final uploadedFiles = <UploadedFileModel>[].obs;


  void nextPage() {
    if (currentIndex.value < 3) {
      currentIndex.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
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
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
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
      uploadedFiles.add(
        UploadedFileModel(
          name: image.name,
          path: image.path,
          isPdf: false,
        ),
      );
    }
  }
}

