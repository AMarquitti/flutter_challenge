import 'dart:convert';

class ActivityModel {
  final int workouts;
  final String title;
  final String subtitle;
  final String image;
  ActivityModel({
    this.workouts,
    this.title,
    this.subtitle,
    this.image,
  });

  ActivityModel copyWith({
    int workouts,
    String title,
    String subtitle,
    String image,
  }) {
    return ActivityModel(
      workouts: workouts ?? this.workouts,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'workouts': workouts,
      'title': title,
      'subtitle': subtitle,
      'image': image,
    };
  }

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ActivityModel(
      workouts: map['workouts'],
      title: map['title'],
      subtitle: map['subtitle'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityModel.fromJson(String source) => ActivityModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ActivityModel(workouts: $workouts, title: $title, subtitle: $subtitle, image: $image)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ActivityModel &&
      o.workouts == workouts &&
      o.title == title &&
      o.subtitle == subtitle &&
      o.image == image;
  }

  @override
  int get hashCode {
    return workouts.hashCode ^
      title.hashCode ^
      subtitle.hashCode ^
      image.hashCode;
  }
}
