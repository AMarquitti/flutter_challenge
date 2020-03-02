import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(nullable: false)
class UserModel {
  String gender;
  _Name name;
  String email;
  _Dob dob;
  String phone;
  String cell;
  _Picture picture;

  //Some random data
  final int id = Random().nextInt(150000);
  final int activity = Random().nextInt(2);
  final double calories = Random().nextDouble();
  final  double distance =Random().nextDouble();

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
class _Name {
  String title;
  String first;
  String last;

  _Name({this.title, this.first, this.last});
  factory _Name.fromJson(Map<String, dynamic> json) => _$_NameFromJson(json);
  Map<String, dynamic> toJson() => _$_NameToJson(this);
}

@JsonSerializable(nullable: false)
class _Dob {
  String date;
  int age;

  _Dob({this.date, this.age});
  factory _Dob.fromJson(Map<String, dynamic> json) => _$_DobFromJson(json);
  Map<String, dynamic> toJson() => _$_DobToJson(this);
}

@JsonSerializable(nullable: false)
class _Picture {
  String large;
  String medium;
  String thumbnail;

  _Picture({this.large, this.medium, this.thumbnail});

  factory _Picture.fromJson(Map<String, dynamic> json) =>
      _$_PictureFromJson(json);
  Map<String, dynamic> toJson() => _$_PictureToJson(this);
}
