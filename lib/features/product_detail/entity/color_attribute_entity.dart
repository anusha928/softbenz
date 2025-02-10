import 'package:json_annotation/json_annotation.dart';

part 'color_attribute_entity.g.dart';

@JsonSerializable()
class ColorAttributeEntity {
  ColorAttributeEntity({
    this.id,
    this.isTwin,
    this.name,
    this.colorValue,
  });

  @JsonKey(name: '_id', defaultValue: "", includeIfNull: true)
  final String? id;

  @JsonKey(name: 'isTwin', defaultValue: false, includeIfNull: true)
  final bool? isTwin;

  @JsonKey(name: 'name', defaultValue: "", includeIfNull: true)
  final String? name;

  @JsonKey(name: 'colorValue', defaultValue: [], includeIfNull: true)
  final List<String>? colorValue;

  factory ColorAttributeEntity.fromJson(Map<String, dynamic> json) =>
      _$ColorAttributeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ColorAttributeEntityToJson(this);
}
