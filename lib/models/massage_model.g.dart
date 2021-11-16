// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'massage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MassageModel _$MassageModelFromJson(Map<String, dynamic> json) {
  return MassageModel(
    massage: json['massage'] as String,
    name: json['name'] as String,
    id: json['id'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$MassageModelToJson(MassageModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'massage': instance.massage,
      'phone': instance.phone,
      'id': instance.id,
    };
