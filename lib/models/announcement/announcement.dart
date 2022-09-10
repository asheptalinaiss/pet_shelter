import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pet_shelter/models/geo_position/geo_position.dart';
import 'package:pet_shelter/models/pet_type.dart';

part 'announcement.freezed.dart';
part 'announcement.g.dart';

@freezed
class Announcement with _$Announcement {
  const factory Announcement({
    int? id,
    required PetType petType,
    required String imageUrl,
    required String title,
    required String description,
    required GeoPosition geoPosition
  }) = _Announcement;

  factory Announcement.fromJson(Map<String, Object?> json) =>
      _$AnnouncementFromJson(json);
}