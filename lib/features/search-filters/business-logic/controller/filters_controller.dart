import 'package:final_servixa/features/search-filters/data/models/filters_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class FilterController extends GetxController {
  final locationController = TextEditingController();
  final minPriceController = TextEditingController();
  final maxPriceController = TextEditingController();
  
  RxBool locationCheck = false.obs;
  RxBool categoryCheck = false.obs;
  RxBool subCategoryCheck = false.obs;
  RxBool budgetCheck = false.obs;
  RxBool adTypeCheck = false.obs;
  RxBool postedSinceCheck = false.obs;


  String? selectedCategory;
  String? selectedSubCategory;
  String? adType;
  String? postedSince;

  @override
  void onClose() {
    locationController.dispose();
    minPriceController.dispose();
    maxPriceController.dispose();
    super.onClose();
  }

  FilterModel getFilters() {
    return FilterModel(
      location: locationController.text,
      category: selectedCategory,
      subCategory: selectedSubCategory,
      minPrice: int.tryParse(minPriceController.text),
      maxPrice: int.tryParse(maxPriceController.text),
      adType: adType,
      postedSince: postedSince,
    );
  }

  void resetFilters() {
    locationController.clear();
    minPriceController.clear();
    maxPriceController.clear();

    selectedCategory = null;
    selectedSubCategory = null;
    adType = null;
    postedSince = null;

    update();
  }
}
