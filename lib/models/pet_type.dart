import 'package:freezed_annotation/freezed_annotation.dart';

enum PetType {
  @JsonValue("cat") cat,
  @JsonValue("dog") dog,
  @JsonValue("other") other
}