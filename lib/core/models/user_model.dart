import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(nullable: false)
class UserModel {
  String gender;
  Name name;
  String email;
  Dob dob;
  String phone;
  String cell;
  Picture picture;

  UserModel(
      {this.gender,
      this.name,
      this.email,
      this.dob,
      this.phone,
      this.cell,
      this.picture});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable(nullable: false)
class Name {
  String title;
  String first;
  String last;

  Name({this.title, this.first, this.last});
  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable(nullable: false)
class Dob {
  String date;
  int age;

  Dob({this.date, this.age});
  factory Dob.fromJson(Map<String, dynamic> json) => _$DobFromJson(json);
  Map<String, dynamic> toJson() => _$DobToJson(this);
}

@JsonSerializable(nullable: false)
class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);
  Map<String, dynamic> toJson() => _$PictureToJson(this);
}
