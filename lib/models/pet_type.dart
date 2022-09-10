import 'package:freezed_annotation/freezed_annotation.dart';

enum PetType {
  @JsonValue("cat") Cat,
  @JsonValue("dog") Dog,
  @JsonValue("other") Other
}