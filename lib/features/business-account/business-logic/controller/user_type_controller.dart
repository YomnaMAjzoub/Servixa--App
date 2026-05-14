import 'package:final_servixa/features/business-account/data/models/user_type_model.dart';
import 'package:final_servixa/features/business-account/data/src/user_type_service.dart';
import 'package:get/get.dart';

class UserTypeController extends GetxController {
  UserTypeService userTypeService = UserTypeService();
  RxBool isloading = false.obs;

  RxList<UserTypeModel> user = <UserTypeModel>[].obs;

  @override
  void onInit() {
    getUserTypes();
    super.onInit();
  }


  Future<void> getUserTypes() async {
    try {
      isloading.value = true;
      user.value = await userTypeService.getUserTypes();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isloading.value = false;
    }
  }
}
