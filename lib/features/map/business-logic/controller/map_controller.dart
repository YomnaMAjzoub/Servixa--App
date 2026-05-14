import 'package:final_servixa/features/map/data/models/location_model.dart';
import 'package:final_servixa/features/map/data/src/map_service.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {

  final MapService _service = MapService();

  RxBool isLoading = false.obs;

  Rxn<LocationModel> selectedLocation =
      Rxn<LocationModel>();

  RxSet<Marker> markers =
      <Marker>{}.obs;

  Rxn<GoogleMapController> mapController =
      Rxn<GoogleMapController>();

  static const CameraPosition
      initialCameraPosition =
      CameraPosition(
    target: LatLng(
      33.5138,
      36.2765,
    ),
    zoom: 14,
  );

  @override
  void onInit() {

    super.onInit();

    initCurrentLocation();
  }

  Future<void>
      initCurrentLocation() async {

    try {

      isLoading.value = true;

      update();

      final pos =
          await _service.getCurrentLocation();

      final address =
          await _service.getAddressFromLatLng(
        lat: pos.latitude,
        lng: pos.longitude,
      );

      _setLocation(
        LocationModel(
          lat: pos.latitude,
          lng: pos.longitude,
          address: address,
        ),
      );

      mapController.value?.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(
            pos.latitude,
            pos.longitude,
          ),
        ),
      );

    } catch (e) {

      Get.snackbar(
        'Error',
        e.toString(),
      );

    } finally {

      isLoading.value = false;

      update();
    }
  }

  Future<void>
      selectLocation(
    LatLng latLng,
  ) async {

    final address =
        await _service.getAddressFromLatLng(
      lat: latLng.latitude,
      lng: latLng.longitude,
    );

    _setLocation(
      LocationModel(
        lat: latLng.latitude,
        lng: latLng.longitude,
        address: address,
      ),
    );

    mapController.value?.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  void _setLocation(
    LocationModel location,
  ) {

    selectedLocation.value =
        location;

    markers.value = {
      Marker(
        markerId:
            const MarkerId(
          "selected_location",
        ),

        position: LatLng(
          location.lat,
          location.lng,
        ),
      ),
    };

    update(); 
  }
}