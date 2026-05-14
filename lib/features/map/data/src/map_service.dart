import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MapService {

  Future<Position>
      getCurrentLocation() async {

    bool serviceEnabled;

    LocationPermission permission;

    serviceEnabled =
        await Geolocator
            .isLocationServiceEnabled();

    if (!serviceEnabled) {

  Get.snackbar(
    "Location",
    "Please enable GPS",
  );

  await Geolocator.openLocationSettings();

  return Future.error(
    'Location disabled',
  );
}

    permission =
        await Geolocator.checkPermission();

    if (permission ==
        LocationPermission.denied) {

      permission =
          await Geolocator
              .requestPermission();

      if (permission ==
          LocationPermission.denied) {

        throw 'Location permission denied';
      }
    }

    if (permission ==
        LocationPermission.deniedForever) {

      throw 'Location permission denied forever';
    }

    return await Geolocator
        .getCurrentPosition();
  }

  Future<String>
      getAddressFromLatLng({
    required double lat,
    required double lng,
  }) async {

    final placemarks =
        await placemarkFromCoordinates(
      lat,
      lng,
    );

    if (placemarks.isEmpty) {
      return '';
    }

    final place = placemarks.first;

    return
        '${place.country}, '
        '${place.locality}, '
        '${place.street}';
  }
}