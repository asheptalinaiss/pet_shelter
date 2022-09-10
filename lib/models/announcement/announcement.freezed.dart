// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'announcement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Announcement _$AnnouncementFromJson(Map<String, dynamic> json) {
  return _Announcement.fromJson(json);
}

/// @nodoc
mixin _$Announcement {
  int? get id => throw _privateConstructorUsedError;
  PetType get petType => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  GeoPosition get geoPosition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncementCopyWith<Announcement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementCopyWith<$Res> {
  factory $AnnouncementCopyWith(
          Announcement value, $Res Function(Announcement) then) =
      _$AnnouncementCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      PetType petType,
      String imageUrl,
      String title,
      String description,
      GeoPosition geoPosition});

  $GeoPositionCopyWith<$Res> get geoPosition;
}

/// @nodoc
class _$AnnouncementCopyWithImpl<$Res> implements $AnnouncementCopyWith<$Res> {
  _$AnnouncementCopyWithImpl(this._value, this._then);

  final Announcement _value;
  // ignore: unused_field
  final $Res Function(Announcement) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? petType = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? geoPosition = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      petType: petType == freezed
          ? _value.petType
          : petType // ignore: cast_nullable_to_non_nullable
              as PetType,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      geoPosition: geoPosition == freezed
          ? _value.geoPosition
          : geoPosition // ignore: cast_nullable_to_non_nullable
              as GeoPosition,
    ));
  }

  @override
  $GeoPositionCopyWith<$Res> get geoPosition {
    return $GeoPositionCopyWith<$Res>(_value.geoPosition, (value) {
      return _then(_value.copyWith(geoPosition: value));
    });
  }
}

/// @nodoc
abstract class _$$_AnnouncementCopyWith<$Res>
    implements $AnnouncementCopyWith<$Res> {
  factory _$$_AnnouncementCopyWith(
          _$_Announcement value, $Res Function(_$_Announcement) then) =
      __$$_AnnouncementCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      PetType petType,
      String imageUrl,
      String title,
      String description,
      GeoPosition geoPosition});

  @override
  $GeoPositionCopyWith<$Res> get geoPosition;
}

/// @nodoc
class __$$_AnnouncementCopyWithImpl<$Res>
    extends _$AnnouncementCopyWithImpl<$Res>
    implements _$$_AnnouncementCopyWith<$Res> {
  __$$_AnnouncementCopyWithImpl(
      _$_Announcement _value, $Res Function(_$_Announcement) _then)
      : super(_value, (v) => _then(v as _$_Announcement));

  @override
  _$_Announcement get _value => super._value as _$_Announcement;

  @override
  $Res call({
    Object? id = freezed,
    Object? petType = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? geoPosition = freezed,
  }) {
    return _then(_$_Announcement(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      petType: petType == freezed
          ? _value.petType
          : petType // ignore: cast_nullable_to_non_nullable
              as PetType,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      geoPosition: geoPosition == freezed
          ? _value.geoPosition
          : geoPosition // ignore: cast_nullable_to_non_nullable
              as GeoPosition,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Announcement with DiagnosticableTreeMixin implements _Announcement {
  const _$_Announcement(
      {this.id,
      required this.petType,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.geoPosition});

  factory _$_Announcement.fromJson(Map<String, dynamic> json) =>
      _$$_AnnouncementFromJson(json);

  @override
  final int? id;
  @override
  final PetType petType;
  @override
  final String imageUrl;
  @override
  final String title;
  @override
  final String description;
  @override
  final GeoPosition geoPosition;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Announcement(id: $id, petType: $petType, imageUrl: $imageUrl, title: $title, description: $description, geoPosition: $geoPosition)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Announcement'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('petType', petType))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('geoPosition', geoPosition));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Announcement &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.petType, petType) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.geoPosition, geoPosition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(petType),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(geoPosition));

  @JsonKey(ignore: true)
  @override
  _$$_AnnouncementCopyWith<_$_Announcement> get copyWith =>
      __$$_AnnouncementCopyWithImpl<_$_Announcement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnnouncementToJson(
      this,
    );
  }
}

abstract class _Announcement implements Announcement {
  const factory _Announcement(
      {final int? id,
      required final PetType petType,
      required final String imageUrl,
      required final String title,
      required final String description,
      required final GeoPosition geoPosition}) = _$_Announcement;

  factory _Announcement.fromJson(Map<String, dynamic> json) =
      _$_Announcement.fromJson;

  @override
  int? get id;
  @override
  PetType get petType;
  @override
  String get imageUrl;
  @override
  String get title;
  @override
  String get description;
  @override
  GeoPosition get geoPosition;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementCopyWith<_$_Announcement> get copyWith =>
      throw _privateConstructorUsedError;
}
