class CityModel {

  final int id;
  final String cityName;

  CityModel({
    required this.id,
    required this.cityName,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {

    return CityModel(
      id: json['id'],
      cityName: json['name'],
    );
  }

  static List<CityModel> fromJsonList(List<dynamic> json) {

    return json
        .map((city) => CityModel.fromJson(city))
        .toList();
  }
}