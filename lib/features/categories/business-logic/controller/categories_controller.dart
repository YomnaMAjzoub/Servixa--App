import 'package:final_servixa/features/categories/data/src/categories_service.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final RxBool isLoading = false.obs;
  RxList categories = [].obs;
  final CategoriesService categoriesService = CategoriesService();
  @override
  void onInit() {
    super.onInit();
    getcategories();
  }

  Future<void> getcategories({int? parentId}) async {
    try {
      isLoading.value = true;
      categories.value = await categoriesService.getcategories(
        parentId: parentId,
      );
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
