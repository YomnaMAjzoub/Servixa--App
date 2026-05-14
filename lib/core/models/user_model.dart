class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String? phoneNumber;
  final String? email;
  final String? image;
  final String? name;
 
 

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
    this.email,
    this.image,
    this.name
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      name: json['name']as String?
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
      'name':name
    };
  }

  UserModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? image,
    String?name
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      image: image ?? this.image,
      name:name ?? this.name
    );
  }
}
