import 'package:json_annotation/json_annotation.dart';

part 'category_entity.g.dart';

@JsonSerializable()
class CategoryEntity {
  CategoryEntity({this.id, this.slug, this.title, this.level, this.parentId});

  @JsonKey(name: '_id', defaultValue: "", includeIfNull: true)
  final String? id;

  @JsonKey(name: 'slug', defaultValue: "", includeIfNull: true)
  final String? slug;

  @JsonKey(name: 'title', defaultValue: "", includeIfNull: true)
  final String? title;
  @JsonKey(name: 'level', defaultValue: "", includeIfNull: true)
  final String? level;

  @JsonKey(name: 'parentId', defaultValue: "", includeIfNull: true)
  final String? parentId;

  factory CategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);
}
