import 'package:dio/dio.dart';
import 'package:final_servixa/features/categories/data/models/categories_model.dart';
import 'package:get_storage/get_storage.dart';

class CategoriesService {
  final Dio dio = Dio();
  final storage = GetStorage();

  Future<List<CategoriesModel>> getMaincategories() async {
    try {
      Response response = await dio.get(
        'https://services.tamkeen-dev.com/api/v1/categories',
        options: Options(
          headers: {
            'accept': 'application/json',
            "Authorization": "Bearer ${storage.read('token') ?? ''}",
          },
        ),
      );
      if (response.statusCode == 200) {
        final data = response.data['data'];

return (data as List)
    .map((e) =>
        CategoriesModel.fromJson(e))
    .toList();
      //  return CategoriesModel.fromJsonList(response.data['data']);
      } else {
        throw 'failed to load main categories';
      }
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'an error occured';
    }
  }

  Future<List<CategoriesModel>> getSubcategories({int? parentId}) async {
    try {
      Response response = await dio.get(
        'https://services.tamkeen-dev.com/api/v1/categories',
        options: Options(
          headers: {
            'accept': 'application/json',
            "Authorization": "Bearer ${storage.read('token') ?? ''}",
          },
        ),
        queryParameters: {if (parentId != null) 'parent_id': parentId},
      );
      if (response.statusCode == 200) {
        final data = response.data['data'];

return (data as List)
    .map((e) =>
        CategoriesModel.fromJson(e))
    .toList();
       // return CategoriesModel.fromJsonList(response.data['data']);
      } else {
        throw 'failed to load sub categories';
      }
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'an error occured';
    }
  }

  Future<CategoriesModel> getCategoryDetails(int categoryId) async {
    try {
      Response response = await dio.get(
        'https://services.tamkeen-dev.com/api/v1/categories/$categoryId',
        options: Options(
          headers: {
            'accept': 'application/json',
            "Authorization": "Bearer ${storage.read('token') ?? ''}",
          },
        ),
      );
      if (response.statusCode == 200) {
        
    return CategoriesModel.fromJson(response.data['data']);
      } else {
        throw 'failed to load category details';
      }
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'an error occured';
    }
  }
}
