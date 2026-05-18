import 'package:final_servixa/features/business-account/data/models/user_type_model.dart';
import 'package:final_servixa/features/dynamic-fields/data/models/custom_field_model.dart';

class CategoriesModel {
  final int id;
  final String name;
  final String slug;
  final String type;
  final int? parentId;
   final bool isActive;
 final  bool hasChildren;
  final IconDataModel? icon;
   List<CustomFieldModel> customFields;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.type,
     this.parentId,
    required this.isActive,
    required this.hasChildren,
    this.icon,
    required this.customFields,
  });

  bool get isMainCategory =>
      parentId == null;

  bool get isSubCategory =>
      parentId != null;


  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      type: json['type'],
      parentId: json['parent_id'],
      isActive: json['is_active'] ?? false,
      hasChildren: json['has_children']?? false,
      icon: json['icon'] != null
          ? IconDataModel.fromJson(
              json['icon'],
            )
          : null,
      customFields:
          json['custom_fields'] != null
              ? (json['custom_fields']
                      as List)
                  .map(
                    (e) =>
                        CustomFieldModel
                            .fromJson(e),
                  )
                  .toList()
              : [],
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
