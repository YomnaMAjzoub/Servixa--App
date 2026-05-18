class CustomFieldModel {
  int id;
  int categoryId;
  String name;
  int type;
  String? unitOfMasure;
  dynamic metadata;

  CustomFieldModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.type,
    this.unitOfMasure,
    this.metadata,
  });
  factory CustomFieldModel.fromJson(Map<String, dynamic> json) {
    return CustomFieldModel(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      type: json['type'],
      unitOfMasure: json['unit_of_masure'],
      metadata: json['metadata'],
    );
  }
  static List<CustomFieldModel>fromJsonList(Map<String,dynamic>json){
    List<CustomFieldModel> customfield = [];
    for(var customField in json['custom_fields']){
      customfield.add(CustomFieldModel.fromJson(customField));
    }
    return customfield;
  }
}
