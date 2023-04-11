import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_strings.dart';

enum PetType {
  @JsonValue("cat") cat,
  @JsonValue("dog") dog,
  @JsonValue("other") other;

  String getIconName() {
    switch (this) {
      case PetType.cat:
        return AppAssets.petTypeCatIcon;
      case PetType.dog:
        return AppAssets.petTypeDogIcon;
      default:
        return AppAssets.petTypeBunnyIcon;
    }
  }

  String getDisplayName() {
    switch (this) {
      case PetType.cat:
        return AppStrings.catTitle;
      case PetType.dog:
        return AppStrings.dogTitle;
      default:
        return AppStrings.otherTitle;
    }
  }
}