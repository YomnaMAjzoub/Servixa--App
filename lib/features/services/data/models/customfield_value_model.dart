import 'package:final_servixa/features/dynamic-fields/data/models/custom_field_model.dart';

class CustomfieldValueModel {
  int id;
  int adId;
  dynamic value;
  int categoryCustomFieldId;
  CustomFieldModel customField;

  CustomfieldValueModel({
    required this.id,
    required this.adId,
    required this.value,
    required this.categoryCustomFieldId,
    required this.customField,
  });

  factory CustomfieldValueModel.fromJson(Map<String, dynamic> json) {
    return CustomfieldValueModel(
      id: json['id'],
      adId: json['ad_id'],
      value: json['value'],
      categoryCustomFieldId: json['category_custom_field_id'],
      customField: CustomFieldModel.fromJson(json['custom_field']),
    );
  }
  static List<CustomfieldValueModel> fromJsonList(Map<String, dynamic> json) {
    List<CustomfieldValueModel> customFieldValues = [];
    for (var customFieldValue in json['custom_field_values']) {
      customFieldValues.add(CustomfieldValueModel.fromJson(customFieldValue));
    }
    return customFieldValues;
  }
}
