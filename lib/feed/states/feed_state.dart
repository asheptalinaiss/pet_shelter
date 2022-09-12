import 'dart:core';
import 'package:flutter/material.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/models/announcement/announcement.dart';
import 'package:pet_shelter/models/pet_type.dart';
import 'package:pet_shelter/services/basic_network_service.dart';

class FeedState extends ChangeNotifier {
  PetType? _petType;
  List<Announcement> _announcements = [];

  final BasicNetworkService _networkService;

  // FeedState({required BasicNetworkService networkService}) : _networkService = networkService;
  FeedState(this._networkService) {
    getAds(null);
  }

  String? feedError;

  List<Announcement> get announcements => _announcements;

  void onPetTypeChanged(PetType? petType) {
    _petType = _petType;
    getAds(petType);
  }

  Future<void> getAds(PetType? petType) async {
    feedError = null;
    _announcements = [];
    notifyListeners();

    var result = await _networkService.getAds(petType: petType);

    if (result.success) {
      if (result.body != null) {
        _announcements = result.body!;
      } else {
        feedError = AppStrings.defaultErrorMessage;
      }
    } else {
      // TODO: add handlers for different errors
      feedError = AppStrings.defaultErrorMessage;
    }

    notifyListeners();
  }
}