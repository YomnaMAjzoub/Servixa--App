import 'package:final_servixa/features/categories/data/models/categories_model.dart';
import 'package:final_servixa/features/categories/data/src/categories_service.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final CategoriesService categoriesService = CategoriesService();

  final RxBool isLoading = false.obs;
  RxList<CategoriesModel> categories = <CategoriesModel>[].obs;
  RxList<CategoriesModel> subcategories = <CategoriesModel>[].obs;
  Rx<CategoriesModel?> selectedCategory = Rx<CategoriesModel?>(null);
  Rx<CategoriesModel?> selectedSubCategory = Rx<CategoriesModel?>(null);
  RxMap<int, dynamic> customFieldValues = <int, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
    getMaincategories();
   
  }
  

  Future<void> getMaincategories() async {
    try {
      isLoading.value = true;
      categories.value = await categoriesService.getMaincategories();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> selectcategory(CategoriesModel category) async {
    selectedCategory.value = category;
    selectedSubCategory.value = null;
    subcategories.clear();
    customFieldValues.clear();

    if (category.hasChildren) {
      await getSubcategories(category.id);
    }
  }
  Future<void> getSubcategories(int parentId) async {
    try {
      isLoading.value = true;
      subcategories.value = await categoriesService.getSubcategories(parentId: parentId);

    } catch (e) {
      Get.snackbar('Error', e.toString());

    } finally {
      isLoading.value = false;
    }
  }
  Future<void> selectSubCategory(CategoriesModel subCategory) async {

    try {

      isLoading.value = true;
      selectedSubCategory.value =await categoriesService.getCategoryDetails(subCategory.id);

   } catch (e) {
        Get.snackbar(
        "Error",
        e.toString(),
      );

    } finally {
      isLoading.value = false;
    }
  }

  void setCustomFieldValue(
    int fieldId,
    dynamic value,
  ) {
    customFieldValues[fieldId] = value;
  }
  dynamic getCustomFieldValue(
    int fieldId,
  ) {
   return customFieldValues[fieldId];
  }
}
