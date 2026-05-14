import 'package:final_servixa/features/business-account/data/models/cities_model.dart';
import 'package:final_servixa/features/business-account/data/src/cities_service.dart';
import 'package:get/get.dart';

class CitiesController extends GetxController {

  RxBool isLoading = false.obs;

  RxList<CityModel> cities = <CityModel>[].obs;

  Rxn<CityModel> selectedCity = Rxn<CityModel>();

  final CitiesService _citiesService = CitiesService();

  @override
  void onInit() {

    getCities();

    super.onInit();
  }

  Future<void> getCities() async {

    try {

      isLoading.value = true;

      final result = await _citiesService.getCities();

      cities.assignAll(result);

    } catch (e) {

      Get.snackbar(
        'Error',
        e.toString(),
      );

    } finally {
      isLoading.value = false;
    }
  }
}