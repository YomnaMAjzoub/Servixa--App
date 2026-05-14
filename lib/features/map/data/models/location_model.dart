class LocationModel {
  final double lat;
  final double lng;
  final String? address;

  const LocationModel({
    required this.lat,
    required this.lng,
    this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      "lat": lat,
      "lng": lng,
      "address": address,
    };
  }
}