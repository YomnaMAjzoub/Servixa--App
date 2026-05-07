import 'package:dio/dio.dart';
import 'package:final_servixa/features/business-account/data/models/cities_model.dart';

class CitiesService {

  final Dio dio = Dio();

  Future<List<CityModel>> getCities() async {

    try {

      Response response = await dio.get(
        'https://services.tamkeen-dev.com/api/v1/cities',

        options: Options(
          headers: {
            'accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {

        return CityModel.fromJsonList(
          response.data['data'],
        );
      }

      throw 'Failed to load cities';

    } on DioException catch (e) {

      throw e.response?.data['message']
          ?? 'An error occurred';
    }
  }
}