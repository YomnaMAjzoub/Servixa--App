import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_servixa/features/profile/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

class ProfileService {
  final Dio dio = Dio();
  final token = GetStorage();

  Future<UserModel> updateProfile({
    required int userId,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? city,
    String? addressDetail,
    String? imagePath,
  }) async {
    try {
      FormData formData = FormData();

      if (firstName != null) {
        formData.fields.add(MapEntry('first_name', firstName));
      }
      if (lastName != null) {
        formData.fields.add(MapEntry('last_name', lastName));
      }
      if (phoneNumber != null) {
        formData.fields.add(MapEntry('phone_number', phoneNumber));
      }
      if (email != null) {
        formData.fields.add(MapEntry('email', email));
      }
      if (city != null) {
        formData.fields.add(MapEntry('city', city));
      }
      if (addressDetail != null) {
        formData.fields.add(MapEntry('address_detail', addressDetail));
      }

      if (imagePath != null) {
        formData.files.add(
          MapEntry(
            "image",
            await MultipartFile.fromFile(
              imagePath,
              filename: imagePath.split('/').last,
            ),
          ),
        );
      }

      // Make the POST request
      final response = await dio.post(
        'https://services.tamkeen-dev.com/api/v1/update-profile',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer ${token.read('token') ?? ''}',
          },
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['success'] == true) {
          return UserModel.fromJson(responseData['data']);
        } else {
          throw Exception(
            responseData['message'] ?? 'Failed to update profile',
          );
        }
      } else {
        throw Exception('Failed to update profile: ${response.statusCode}');
      }
    } catch (e) {
      log('Error updating profile: $e');
      throw Exception('Error updating profile: $e');
    }
  }

  Future<UserModel> fetchUserProfile(int userId) async {
    await Future.delayed(Duration(seconds: 1));
    return UserModel(
      id: userId,
      firstName: "Ahmad",
      lastName: "Alshame",
      email: "ahmad.alshame@example.com",
      phoneNumber: "0501234567",
      image:
          "http://build_link.test/storage/1/{1C2B4A28-8617-4475-9C9F-C020C43A5E0C}.png",
      isActive: true,
      city: "syria",
      addressDetail: "742 Evergreen Terrace, Springfield",
    );
  }
}
