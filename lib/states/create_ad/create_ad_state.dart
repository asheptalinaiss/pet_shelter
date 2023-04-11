import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/models/announcement/announcement.dart';
import 'package:pet_shelter/models/geo_coordinate.dart';
import 'package:pet_shelter/models/geo_position/geo_position.dart';
import 'package:pet_shelter/models/pet_type.dart';
import 'package:pet_shelter/repository/local_storage.dart';
import 'package:pet_shelter/services/basic_network_service.dart';
import 'package:pet_shelter/states/create_ad/create_ad_screen_type.dart';

class CreateAdState extends ChangeNotifier {

  CreateAdScreenType _selectedScreen = CreateAdScreenType.addPhoto;
  File? _photoFile;
  GeoCoordinate? _geoCoordinate;
  PetType _petType = PetType.cat;
  String? _title;
  String? _description;

  String? titleError;
  String? descriptionError;

  final BasicNetworkService networkService;
  final LocalStorage localStorage;

  CreateAdState({required this.networkService, required this.localStorage});

  CreateAdScreenType get selectedScreen => _selectedScreen;
  File? get photo => _photoFile;
  GeoCoordinate? get geoCoordinate => _geoCoordinate;
  PetType get petType => _petType;
  String? get title => _title;
  String? get description => _description;

  void selectScreen(CreateAdScreenType screenType) {
    if (_selectedScreen != screenType) {
      _selectedScreen = screenType;
      notifyListeners();
    }
  }

  void savePhoto(File photoFile) {
    _photoFile = photoFile;
    notifyListeners();
  }

  void saveGeoCoordinate(GeoCoordinate coordinate) {
    _geoCoordinate = coordinate;
    notifyListeners();
  }

  void selectPetType(PetType petType) {
    if (_petType != petType) {
      _petType = petType;
      notifyListeners();
    }
  }

  void onTitleChanged(String titleValue) {
    _title = titleValue;
  }

  void onDescriptionChanged(String descriptionValue) {
    _description = descriptionValue;
  }

  Future<void> createAd() async {
    if (!validateFields()) {
      notifyListeners();
      return;
    }
    // TODO: upload real photo to firebase storage
    const imageUrl = 'https://www.princeton.edu/sites/default/files/styles/half_2x/public/images/2022/02/KOA_Nassau_2697x1517.jpg';
    var result = await networkService.createAd(
      localStorage.getAccessToken()!,
      Announcement(
        petType: _petType,
        imageUrl: imageUrl,
        title: _title!,
        description: _description!,
        geoPosition: GeoPosition(lat: _geoCoordinate!.latitude, lng: _geoCoordinate!.longitude)
      )
    );
    if (result.success) {
      if (result.body != null) {
        print('Successfully added ad');
        // onSuccess();
      } else {
        // signInError = AppStrings.defaultErrorMessage;
      }
    } else {
      // TODO: add handlers for different errors
      // signInError = AppStrings.defaultErrorMessage;
      notifyListeners();
    }
  }

  bool validateFields() {
    if (_title == null || _title!.isEmpty) {
      titleError = AppStrings.emptyFieldError;
    } else if (_title!.length > 46) {
      titleError = AppStrings.textTooLongError;
    }
    if (_description == null || _description!.isEmpty) {
      descriptionError = AppStrings.emptyFieldError;
    }
    return titleError == null && descriptionError == null;
  }
}