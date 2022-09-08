import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_shelter/login/views/login.dart';
import 'package:pet_shelter/repository/local_storage.dart';
import 'package:pet_shelter/repository/shared_preferences_storage.dart';
import 'package:pet_shelter/services/basic_network_service.dart';
import 'package:pet_shelter/services/http_network_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferencesStorage localStorage = SharedPreferencesStorage();
  await localStorage.init();
  GetIt.instance.registerSingleton<LocalStorage>(localStorage);
  GetIt.instance.registerSingleton<BasicNetworkService>(HttpNetworkService());

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