class FilterModel {
  String? location;
  String? category;
  String? subCategory;
  int? minPrice;
  int? maxPrice;
  String? adType;
  String? postedSince;

  FilterModel({
    this.location,
    this.category,
    this.subCategory,
    this.minPrice,
    this.maxPrice,
    this.adType,
    this.postedSince,
  });
}