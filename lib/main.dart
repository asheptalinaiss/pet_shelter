import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_shelter/login/views/login.dart';
import 'package:pet_shelter/services/basic_network_service.dart';
import 'package:pet_shelter/services/network_service.dart';

void main() {
  GetIt.instance.registerSingleton<BasicNetworkService>(NetworkService());
  runApp(const PetShelterApp());
}

class PetShelterApp extends StatelessWidget {
  const PetShelterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pet Shelter',
      home: Login()
    );
  }
}