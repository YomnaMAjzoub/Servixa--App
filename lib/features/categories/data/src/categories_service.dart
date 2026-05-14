import 'package:dio/dio.dart';
import 'package:final_servixa/features/categories/data/models/categories_model.dart';
import 'package:get_storage/get_storage.dart';

class CategoriesService {
  final Dio dio = Dio();

  Future<List<CategoriesModel>> getcategories({int? parentId}) async {
    try {
      Response response = await dio.get(
        'https://services.tamkeen-dev.com/api/v1/categories',
        options: Options(
          headers: {
            'accept': 'application/json',
            "Authorization": "Bearer ${GetStorage().read('token') ?? ''}",
          },
        ),
        queryParameters: {if (parentId != null) 'parent_id': parentId},
      );
      if (response.statusCode == 200) {
        return CategoriesModel.fromJsonList(response.data);
      } else {
        throw 'failed to load categories';
      }
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'an error occured';
    }
  }
}
