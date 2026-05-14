import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_servixa/features/business-account/data/models/business_acc_model.dart';
import 'package:get_storage/get_storage.dart';

class BusinessAccService {

  final Dio dio = Dio();

  Future<BusinessAccModel>
      createBusinessAccount({

    required int userTypeId,

    required int cityId,

    required int accountType,

    required String businessNameAr,

    required String businessNameEn,

    required String licenseNumber,

    required String businessAddress,

    required String activities,

    required String details,

    required double lat,

    required double lng,

    required List<File> documents,

  }) async {

    try {

      FormData formData =
          FormData.fromMap({

        "user_type_id":
            userTypeId,

        "city_id":
            cityId,

        "account_type":
            accountType,

        "business_name[ar]":
            businessNameAr,

        "business_name[en]":
            businessNameEn,

        "license_number":
            licenseNumber,

        "business_address":
            businessAddress,

        "activities":
            activities,

        "details":
            details,

        "lat":
            lat,

        "lng":
            lng,

        "documents[]":
            await Future.wait(

          documents.map(

            (file) async =>

                await MultipartFile
                    .fromFile(

              file.path,

              filename:
                  file.path
                      .split('/')
                      .last,
            ),
          ),
        ),
      });

      Response response =
          await dio.post(

        'https://services.tamkeen-dev.com/api/v1/business-accounts',

        data: formData,

        options: Options(

          headers: {

            "Accept":
                "application/json",

            "Authorization":
                "Bearer ${GetStorage().read('token') ?? ''}",

            "Content-Type":
                "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201) {

        return BusinessAccModel.fromJson(
          response.data['data'],
        );
      }

      throw "Failed to create business account";

    } on DioException catch (e) {

      throw e.response?.data['message']
          ?? "Server Error";
    }
  }
}