import 'package:json_annotation/json_annotation.dart';

part 'bread_crumb_entity.g.dart';

@JsonSerializable()
class BreadCrumbEntity {
  BreadCrumbEntity({
    this.title,
    this.slug,
  });

  @JsonKey(name: 'title', defaultValue: "", includeIfNull: true)
  final String? title;

  @JsonKey(name: 'slug', defaultValue: "", includeIfNull: true)
  final String? slug;

  factory BreadCrumbEntity.fromJson(Map<String, dynamic> json) =>
      _$BreadCrumbEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BreadCrumbEntityToJson(this);
}
