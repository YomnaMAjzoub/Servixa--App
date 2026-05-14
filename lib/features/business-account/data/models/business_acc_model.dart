import 'package:final_servixa/core/models/user_model.dart';
import 'package:final_servixa/features/business-account/data/models/cities_model.dart';
import 'package:final_servixa/features/business-account/data/models/documents_model.dart';
import 'package:final_servixa/features/business-account/data/models/user_type_model.dart';

class BusinessAccModel {

  final int id;

  final int userTypeId;

  final int cityId;


  final BusinessNameModel businessName;

  final String licenseNumber;

  final String businessAddress;

  final String activities;

  final String details;

  final int userId;

  final double lat;

  final double lng;

  final UserModel user;

  final UserTypeModel userType;

  final CityModel city;

  final List<DocumentsModel> documents;

  BusinessAccModel({

    required this.id,

    required this.userTypeId,

    required this.cityId,

   

    required this.businessName,

    required this.licenseNumber,

    required this.businessAddress,

    required this.activities,

    required this.details,

    required this.userId,

    required this.lat,

    required this.lng,

    required this.user,

    required this.userType,

    required this.city,

    required this.documents,
  });

  factory BusinessAccModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return BusinessAccModel(

      id: json['id'],

      userTypeId:
          int.parse(
        json['user_type_id'].toString(),
      ),

      cityId:
          int.parse(
        json['city_id'].toString(),
      ),


      businessName:
          BusinessNameModel.fromJson(
        json['business_name'],
      ),

      licenseNumber:
          json['license_number'],

      businessAddress:
          json['business_address'],

      activities:
          json['activities'],

      details:
          json['details'],

      userId:
          json['user_id'],

      lat:
          double.parse(
        json['lat'].toString(),
      ),

      lng:
          double.parse(
        json['lng'].toString(),
      ),

      user:
          UserModel.fromJson(
        json['user'],
      ),

      userType:
          UserTypeModel.fromJson(
        json['user_type'],
      ),

      city:
          CityModel.fromJson(
        json['city'],
      ),

      documents:
          (json['documents'] as List)
              .map(
                (e) =>
                    DocumentsModel.fromJson(e),
              )
              .toList(),
    );
  }
}

class BusinessNameModel {

  final String ar;

  final String en;

  BusinessNameModel({

    required this.ar,

    required this.en,
  });

  factory BusinessNameModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return BusinessNameModel(

      ar: json['ar'],

      en: json['en'],
    );
  }
}