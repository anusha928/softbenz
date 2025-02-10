import 'package:json_annotation/json_annotation.dart';

part 'brand_entity.g.dart';

@JsonSerializable()
class BrandEntity {
  BrandEntity({
    this.id,
    this.slug,
    this.name,
  });

  @JsonKey(name: '_id', defaultValue: "", includeIfNull: true)
  final String? id;

  @JsonKey(name: 'slug', defaultValue: "", includeIfNull: true)
  final String? slug;

  @JsonKey(name: 'name', defaultValue: "", includeIfNull: true)
  final String? name;

  factory BrandEntity.fromJson(Map<String, dynamic> json) =>
      _$BrandEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BrandEntityToJson(this);
}
