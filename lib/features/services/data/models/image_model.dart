class ImageModel {
  int id;
  String url;
  String name;
  ImageModel({required this.id, required this.url, required this.name});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(id: json['id'], url: json['url'], name: json['name']);
  }
  static List<ImageModel> fromJsonList(Map<String,dynamic> json) {
    List<ImageModel> images = [];
    for (var image in json['images']) {
      images.add(ImageModel.fromJson(image));
    }
    return images;
  }
}
