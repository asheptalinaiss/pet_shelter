// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Announcement _$$_AnnouncementFromJson(Map<String, dynamic> json) =>
    _$_Announcement(
      id: json['id'] as int?,
      petType: $enumDecode(_$PetTypeEnumMap, json['petType']),
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      geoPosition:
          GeoPosition.fromJson(json['geoPosition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AnnouncementToJson(_$_Announcement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'petType': _$PetTypeEnumMap[instance.petType]!,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'description': instance.description,
      'geoPosition': instance.geoPosition,
    };

const _$PetTypeEnumMap = {
  PetType.Cat: 'cat',
  PetType.Dog: 'dog',
  PetType.Other: 'other',
};
