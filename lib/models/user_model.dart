class UserProfileModel {
  bool? success;
  Data? data;
  String? message;

  UserProfileModel({this.success, this.data, this.message});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  int? id;
  String? name;
  // dynamic contactNumber;
  String? email;
  // dynamic emailVerifiedAt;
  String? imagePath;
  // dynamic about;
  // dynamic address;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      // this.contactNumber,
      this.email,
      // this.emailVerifiedAt,
      this.imagePath,
      // this.about,
      // this.address,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // contactNumber = json['contact_number'];
    email = json['email'];
    // emailVerifiedAt = json['email_verified_at'];
    imagePath = json['image_path'];
    // about = json['about'];
    // address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
