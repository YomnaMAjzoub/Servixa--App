class DocumentsModel {
  int id;
  String url;
  String name;

  DocumentsModel({required this.id, required this.url, required this.name});

  factory DocumentsModel.fromJson(Map<String, dynamic> json) {
    return DocumentsModel(id: json['id'], url: json['url'], name: json['name']);
  }
  
}
