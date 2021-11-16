import 'package:flutter_test_package/entities/massage_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'massage_model.g.dart';
@JsonSerializable()
class MassageModel extends MassageEntity {
  MassageModel({
    String massage,
    String name,
    String id,
    String phone,
  }) : super(massage: massage, name: name, id: id, phone: phone);

  factory MassageModel.fromJson(Map<String, dynamic> json) =>
      _$MassageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MassageModelToJson(this);
}


