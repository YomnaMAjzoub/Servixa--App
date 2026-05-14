import 'package:final_servixa/features/business-account/data/models/user_type_model.dart';

class CategoriesModel {
  final int id;
  final String name;
  final String slug;
  final String type;
  final int? parentId;
  final IconDataModel icon;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.type,
    this.parentId,
    required this.icon,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      type: json['type'],
      icon: IconDataModel.fromJson(json['icon']),
    );
  }
  static List<CategoriesModel> fromJsonList(Map<String, dynamic> json) {
    List<CategoriesModel> category = [];
    for (var item in json['data']) {
      category.add(CategoriesModel.fromJson(item));
    }
    return category;
  }
}
