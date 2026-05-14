import 'package:dio/dio.dart';
import 'package:final_servixa/features/business-account/data/models/user_type_model.dart';

class UserTypeService {
  final Dio dio = Dio();
  Future<List<UserTypeModel>> getUserTypes() async {
    try {
      Response response = await dio.get(
        'https://services.tamkeen-dev.com/api/v1/user-types',
        options: Options(headers: {'accept': 'application/json'}),
      );
      if (response.statusCode == 200) {
        return UserTypeModel.fromJsonList(response.data);
      } else {
        throw 'Faild to load types';
      }
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'An error occurred';
    }
  }
}
