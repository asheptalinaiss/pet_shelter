import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_shelter/login/views/login.dart';
import 'package:pet_shelter/main/views/main_screen.dart';
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
  GetIt.instance.registerSingleton<ImagePicker>(ImagePicker());

  runApp(const PetShelterApp());
}

class PetShelterApp extends StatelessWidget {
  const PetShelterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Shelter',
      home: _isAuthorized() ? const MainScreen() : const Login()
    );
  }

  bool _isAuthorized() {
    return GetIt.instance.get<LocalStorage>().getAccessToken() != null
        && GetIt.instance.get<LocalStorage>().getRefreshToken() != null;
  }
}