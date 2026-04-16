import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_servixa/core/errors/error_handler.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  Dio dio = Dio();
  final GetStorage storage = GetStorage();

  Future<bool> login(String email, String password) async {
    try {
      Response response = await dio.post(
        'https://services.tamkeen-dev.com/api/v1/login',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'content-type': 'application/json',
          },
        ),
        data: {'email': email, 'password': password},
      );
      log(response.data.toString());

      if (response.statusCode == 200 && response.data['success'] == true) {
        final token = response.data['data']['token'];

        if (token != null) {
          storage.write('token', token);
          return true;
        } else {
          throw 'Token not found in response';
        }
      } else {
        throw response.data['message'] ?? 'Login failed';
      }
    } on DioException catch (e) {
      throw ErrorHandler.handle(e);
    } catch (e) {
      throw e.toString();
    }
  }
  

  Future<bool> forgetPass(String email) async {
    try {
      Response response = await dio.post(
        'https://services.tamkeen-dev.com/api/v1/forget-password',
        options: Options(headers: {'Accept': 'application/json'}),
        data: {'email': email},
      );
     if (response.data['data']['success'] != true) {
      throw response.data['data']['message'];
    }
      return response.statusCode == 200;

    } on DioException catch (e) {
      throw ErrorHandler.handle(e);
    }
  }


  Future<bool> verifyCode(String email, String code) async {
    try {
      Response response = await dio.post(
        'https://services.tamkeen-dev.com/api/v1/verify-code',
        options: Options(headers: {'Accept': 'application/json'}),
        data: {'email': email, 'code': code},
      );

      if (response.data['data']['success'] != true) {
      throw response.data['data']['message'];
    }
      return response.statusCode == 200;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e);
    }
  }


  Future<bool> resetPass(String email, String code, String password) async {
    try {
      Response response = await dio.post(
        'https://services.tamkeen-dev.com/api/v1/reset-password',
        options: Options(headers: {'Accept': 'application/json'}),
        data: {'email': email, 'code': code, 'password': password},
      );
      if (response.data['data']['success'] != true) {
      throw response.data['data']['message'];
    }
      return response.statusCode == 200;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e);
    }
  }


  Future<bool> register(
    String firstname,
    String lastname,
    String? email,
    String password,
    String? phone,
  ) async {
    try {
      Response response = await dio.post(
        'https://services.tamkeen-dev.com/api/v1/register',
        options: Options(headers: {'Accept': 'application/json'}),
        data: {
          'first_name': firstname,
          'last_name': lastname,
          'email': email,
          'phone': phone,
          'password': password,
        },
      );

      //  token.write('token', response.data['data']['token']);
      return response.statusCode == 200;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw 'Connection error , try again later';
      } else if (e.response != null && e.response?.statusCode == 422) {
        throw e.response?.data['message'];
      } else if (e.response != null && e.response?.statusCode == 500) {
        throw 'Server error , try again later';
      } else {
        throw e.response?.data['message'] ?? 'an error occured';
      }
    }
  }

  

  

  

  Future<bool> verifyEmail(String email, String code) async {
    try {
      Response response = await dio.post(
        'https://services.tamkeen-dev.com/api/v1/verify-email',
        options: Options(headers: {'Accept': 'application/json'}),
        data: {'email': email, 'code': code},
      );
      // token.write('token', response.data['data']['token']);
      return response.statusCode == 200;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw 'Connection error , try again later';
      } else {
        throw e.response?.data['message'] ??
            'An error occurred , try again later';
      }
    }
  }

  Future<bool> logout() async {
    try {
      Response response = await dio.post(
        'https://services.tamkeen-dev.com/api/v1/logout',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'content-type': 'application/json',
            //  'Authorization': 'Bearer ${token.read('token')}',
          },
        ),
      );
      //  token.remove('token');
      return response.statusCode == 200;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e);
    }
    catch (e) {
    throw e.toString();
  }
  }
}
