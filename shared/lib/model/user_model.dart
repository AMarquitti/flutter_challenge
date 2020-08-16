import 'dart:convert';
import 'dart:math';

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
  final double distance = Random().nextDouble();

  UserModel(this.gender, this.name, this.email, this.dob, this.phone, this.cell,
      this.picture);

  UserModel copyWith({
    String gender,
    _Name name,
    String email,
    _Dob dob,
    String phone,
    String cell,
    _Picture picture,
  }) {
    return UserModel(
      gender ?? this.gender,
      name ?? this.name,
      email ?? this.email,
      dob ?? this.dob,
      phone ?? this.phone,
      cell ?? this.cell,
      picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'name': name?.toMap(),
      'email': email,
      'dob': dob?.toMap(),
      'phone': phone,
      'cell': cell,
      'picture': picture?.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      map['gender'],
      _Name.fromMap(map['name']),
      map['email'],
      _Dob.fromMap(map['dob']),
      map['phone'],
      map['cell'],
      _Picture.fromMap(map['picture']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(gender: $gender, name: $name, email: $email, dob: $dob, phone: $phone, cell: $cell, picture: $picture)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserModel &&
        o.gender == gender &&
        o.name == name &&
        o.email == email &&
        o.dob == dob &&
        o.phone == phone &&
        o.cell == cell &&
        o.picture == picture;
  }

  @override
  int get hashCode {
    return gender.hashCode ^
        name.hashCode ^
        email.hashCode ^
        dob.hashCode ^
        phone.hashCode ^
        cell.hashCode ^
        picture.hashCode;
  }
}

class _Name {
  String title;
  String first;
  String last;
  _Name({
    this.title,
    this.first,
    this.last,
  });

  _Name copyWith({
    String title,
    String first,
    String last,
  }) {
    return _Name(
      title: title ?? this.title,
      first: first ?? this.first,
      last: last ?? this.last,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'first': first,
      'last': last,
    };
  }

  factory _Name.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return _Name(
      title: map['title'],
      first: map['first'],
      last: map['last'],
    );
  }

  String toJson() => json.encode(toMap());

  factory _Name.fromJson(String source) => _Name.fromMap(json.decode(source));

  @override
  String toString() => '_Name(title: $title, first: $first, last: $last)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _Name && o.title == title && o.first == first && o.last == last;
  }

  @override
  int get hashCode => title.hashCode ^ first.hashCode ^ last.hashCode;
}

class _Dob {
  String date;
  int age;
  _Dob({
    this.date,
    this.age,
  });

  _Dob copyWith({
    String date,
    int age,
  }) {
    return _Dob(
      date: date ?? this.date,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'age': age,
    };
  }

  factory _Dob.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return _Dob(
      date: map['date'],
      age: map['age'],
    );
  }

  String toJson() => json.encode(toMap());

  factory _Dob.fromJson(String source) => _Dob.fromMap(json.decode(source));

  @override
  String toString() => '_Dob(date: $date, age: $age)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _Dob && o.date == date && o.age == age;
  }

  @override
  int get hashCode => date.hashCode ^ age.hashCode;
}

class _Picture {
  String large;
  String medium;
  String thumbnail;
  _Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  _Picture copyWith({
    String large,
    String medium,
    String thumbnail,
  }) {
    return _Picture(
      large: large ?? this.large,
      medium: medium ?? this.medium,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'large': large,
      'medium': medium,
      'thumbnail': thumbnail,
    };
  }

  factory _Picture.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return _Picture(
      large: map['large'],
      medium: map['medium'],
      thumbnail: map['thumbnail'],
    );
  }

  String toJson() => json.encode(toMap());

  factory _Picture.fromJson(String source) =>
      _Picture.fromMap(json.decode(source));

  @override
  String toString() =>
      '_Picture(large: $large, medium: $medium, thumbnail: $thumbnail)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _Picture &&
        o.large == large &&
        o.medium == medium &&
        o.thumbnail == thumbnail;
  }

  @override
  int get hashCode => large.hashCode ^ medium.hashCode ^ thumbnail.hashCode;
}
