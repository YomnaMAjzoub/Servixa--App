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

  Future<bool> register(String firstName, String lastName, String email, String password) async {
    try {
      Response response = await dio.post(
        'https://services.tamkeen-dev.com/api/v1/register',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'content-type': 'application/json',
          },
        ),
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
        },
      );
      log('Register Response: ${response.data.toString()}');
      if (response.statusCode == 200 && response.data['message'] == 'success') {
        final token = response.data['data']['token'];
        if (token != null) {
          await storage.write('token', token);
        }
        return true;
      } else {
        throw response.data['message'] ?? 'Registration failed';
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


  Future<bool> verifyEmail(String email, String code) async {
    try {
      Response response = await dio.post(
        'https://services.tamkeen-dev.com/api/v1/verify-email',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'content-type': 'application/json',
          },
        ),
        data: {'email': email, 'code': code},
      );
      log('Verify Email Response: ${response.data.toString()}');
      if (response.statusCode == 200 && response.data['message'] == 'success') {
        
        final token = response.data['data']['token'];
        if (token != null) {
          await storage.write('token', token);
        }
        return true;
      } else {
        throw response.data['message'] ?? 'Email verification failed';
      }
    } on DioException catch (e) {
      throw ErrorHandler.handle(e);
    } catch (e) {
      throw e.toString();
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
