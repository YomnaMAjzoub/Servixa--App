class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String? phoneNumber;
  final String? email;
  final String? image;
  final bool? isActive;
  final String? city;
  final String? addressDetail;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
    this.email,
    this.image,
    this.isActive,
    this.city,
    this.addressDetail,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      isActive: json['is_active'] as bool?,
      city: json['city'] as String?,
      addressDetail: json['address_detail'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'email': email,
      'image': image, 
      'is_active': isActive,
      'city': city,
      'address_detail': addressDetail,
    };
  }

  UserModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? image,
    bool? isActive,
    String? city,
    String? addressDetail,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      image: image ?? this.image,
      isActive: isActive ?? this.isActive,
      city: city ?? this.city,
      addressDetail: addressDetail ?? this.addressDetail,
    );
  }
}

