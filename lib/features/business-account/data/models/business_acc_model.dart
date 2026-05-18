import 'package:final_servixa/core/models/user_model.dart';
import 'package:final_servixa/features/business-account/data/models/cities_model.dart';
import 'package:final_servixa/features/business-account/data/models/documents_model.dart';
import 'package:final_servixa/features/business-account/data/models/user_type_model.dart';

class BusinessAccModel {
  int id;

  int userTypeId;

  int cityId;

  String businessName;

  String licenseNumber;

  String businessAddress;

  String activities;

  String details;

  double lat;

  double lng;

  UserModel user;

  UserTypeModel userType;

  CityModel city;

  List<FileModel>? documents;

  BusinessAccModel({
    required this.id,

    required this.userTypeId,

    required this.cityId,

    required this.businessName,

    required this.licenseNumber,

    required this.businessAddress,

    required this.activities,

    required this.details,

    required this.lat,

    required this.lng,

    required this.user,

    required this.userType,

    required this.city,

    this.documents,
  });

  factory BusinessAccModel.fromJson(Map<String, dynamic> json) {
    return BusinessAccModel(
      id: json['id'],

      userTypeId: int.parse(json['user_type_id'].toString()),

      cityId: int.parse(json['city_id'].toString()),

      businessName: json['business_name'] ?? '',

      licenseNumber: json['license_number'] ?? '',

      businessAddress: json['business_address'] ?? '',

      activities: json['activities'] ?? '',

      details: json['details'] ?? '',

      lat: double.parse(json['lat'].toString()),

      lng: double.parse(json['lng'].toString()),

      user: UserModel.fromJson(json['user']),

      userType: UserTypeModel.fromJson(json['user_type']),

      city: CityModel.fromJson(json['city']),

      documents: json['documents'] != null
          ? (json['documents'] as List)
                .map((e) => FileModel.fromJson(e))
                .toList()
          : [],
    );
  }
}
