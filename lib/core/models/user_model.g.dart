// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    gender: json['gender'] as String,
    name: Name.fromJson(json['name'] as Map<String, dynamic>),
    email: json['email'] as String,
    dob: Dob.fromJson(json['dob'] as Map<String, dynamic>),
    phone: json['phone'] as String,
    cell: json['cell'] as String,
    picture: Picture.fromJson(json['picture'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'gender': instance.gender,
      'name': instance.name,
      'email': instance.email,
      'dob': instance.dob,
      'phone': instance.phone,
      'cell': instance.cell,
      'picture': instance.picture,
    };

Name _$NameFromJson(Map<String, dynamic> json) {
  return Name(
    title: json['title'] as String,
    first: json['first'] as String,
    last: json['last'] as String,
  );
}

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'title': instance.title,
      'first': instance.first,
      'last': instance.last,
    };

Dob _$DobFromJson(Map<String, dynamic> json) {
  return Dob(
    date: json['date'] as String,
    age: json['age'] as int,
  );
}

Map<String, dynamic> _$DobToJson(Dob instance) => <String, dynamic>{
      'date': instance.date,
      'age': instance.age,
    };

Picture _$PictureFromJson(Map<String, dynamic> json) {
  return Picture(
    large: json['large'] as String,
    medium: json['medium'] as String,
    thumbnail: json['thumbnail'] as String,
  );
}

Map<String, dynamic> _$PictureToJson(Picture instance) => <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'thumbnail': instance.thumbnail,
    };
