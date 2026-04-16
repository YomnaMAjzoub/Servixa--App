class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String? phoneNumber;
  final String? email;
  final String? image;
  final bool? isActive;

UserModel({
  required this.id,
  required this.firstName,
  required this.lastName,
   this.phoneNumber,
   this.email,
   this.image,
   this.isActive
});

}
