class UploadedFileModel {
  final String name;
  final double? size;
  final String path;
  final bool isPdf;

  UploadedFileModel({
    required this.name,
     this.size,
    required this.path,
    required this.isPdf,
  });
}
