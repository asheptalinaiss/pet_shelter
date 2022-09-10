// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'geo_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeoPosition _$GeoPositionFromJson(Map<String, dynamic> json) {
  return _GeoPosition.fromJson(json);
}

/// @nodoc
mixin _$GeoPosition {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoPositionCopyWith<GeoPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoPositionCopyWith<$Res> {
  factory $GeoPositionCopyWith(
          GeoPosition value, $Res Function(GeoPosition) then) =
      _$GeoPositionCopyWithImpl<$Res>;
  $Res call({double lat, double lng});
}

/// @nodoc
class _$GeoPositionCopyWithImpl<$Res> implements $GeoPositionCopyWith<$Res> {
  _$GeoPositionCopyWithImpl(this._value, this._then);

  final GeoPosition _value;
  // ignore: unused_field
  final $Res Function(GeoPosition) _then;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_GeoPositionCopyWith<$Res>
    implements $GeoPositionCopyWith<$Res> {
  factory _$$_GeoPositionCopyWith(
          _$_GeoPosition value, $Res Function(_$_GeoPosition) then) =
      __$$_GeoPositionCopyWithImpl<$Res>;
  @override
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$_GeoPositionCopyWithImpl<$Res> extends _$GeoPositionCopyWithImpl<$Res>
    implements _$$_GeoPositionCopyWith<$Res> {
  __$$_GeoPositionCopyWithImpl(
      _$_GeoPosition _value, $Res Function(_$_GeoPosition) _then)
      : super(_value, (v) => _then(v as _$_GeoPosition));

  @override
  _$_GeoPosition get _value => super._value as _$_GeoPosition;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_$_GeoPosition(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeoPosition with DiagnosticableTreeMixin implements _GeoPosition {
  const _$_GeoPosition({required this.lat, required this.lng});

  factory _$_GeoPosition.fromJson(Map<String, dynamic> json) =>
      _$$_GeoPositionFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GeoPosition(lat: $lat, lng: $lng)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GeoPosition'))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('lng', lng));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeoPosition &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lng, lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(lng));

  @JsonKey(ignore: true)
  @override
  _$$_GeoPositionCopyWith<_$_GeoPosition> get copyWith =>
      __$$_GeoPositionCopyWithImpl<_$_GeoPosition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeoPositionToJson(
      this,
    );
  }
}

abstract class _GeoPosition implements GeoPosition {
  const factory _GeoPosition(
      {required final double lat, required final double lng}) = _$_GeoPosition;

  factory _GeoPosition.fromJson(Map<String, dynamic> json) =
      _$_GeoPosition.fromJson;

  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$$_GeoPositionCopyWith<_$_GeoPosition> get copyWith =>
      throw _privateConstructorUsedError;
}
