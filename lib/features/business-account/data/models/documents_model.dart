class FileModel {
  int id;
  String url;
  String name;

  FileModel({required this.id, required this.url, required this.name});

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(id: json['id'], url: json['url'], name: json['name']);
  }
  static List<FileModel> fromJsonList(List<dynamic> json) {
    return json.map((e) => FileModel.fromJson(e)).toList();
  }
}
