class UserTypeModel {
  int id;
  String name;
  IconDataModel? icon;

  UserTypeModel({
    required this.id,
    required this.name,
     this.icon
  });

  factory UserTypeModel.fromJson(Map<String,dynamic>json){
    return UserTypeModel(
      id:json['id'],
      name:json['name'] ,
       icon: json['icon'] != null
    ? IconDataModel.fromJson(json['icon'])
    : null,
       );
  }

  static List<UserTypeModel> fromJsonList(Map<String, dynamic> json) {
    List<UserTypeModel> user = [];
    for (var type in json['data']) {
      user.add(UserTypeModel.fromJson(type));
    }
    return user;
  }
}

class IconDataModel {
  int id;
  String url;
  String name;
  
  IconDataModel({required this.id, required this.url, required this.name});

  factory IconDataModel.fromJson(Map<String, dynamic> json) {
    return IconDataModel(id: json['id'], url: json['url'], name: json['name']);
  }
  
}
