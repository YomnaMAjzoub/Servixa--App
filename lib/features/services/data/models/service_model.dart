import 'package:final_servixa/core/models/user_model.dart';
import 'package:final_servixa/features/services/data/models/customfield_value_model.dart';
import 'package:final_servixa/features/services/data/models/image_model.dart';

class ServiceModel {
  int id;
  String name;
  String description;
  String price;
  bool isRent;
  int categoryId;
  int userId;
  UserModel user;
  List<CustomfieldValueModel> customFieldValues;
  String mainImage;
  List<ImageModel> images;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.isRent,
    required this.categoryId,
    required this.userId,
    required this.user,
    required this.customFieldValues,
    required this.mainImage,
    required this.images,
  });

}
