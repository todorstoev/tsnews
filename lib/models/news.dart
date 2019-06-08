import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable(nullable: true)
class News {
  News(this.by, this.descendants, this.id, this.score, this.time, this.title,
      this.type, this.url);
  String by;
  int descendants;
  int id;
  int score;
  int time;
  String title;
  String type;
  String url;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
