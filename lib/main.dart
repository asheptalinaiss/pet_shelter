import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_shelter/states/app_state.dart';
import 'package:pet_shelter/navigation/routes.dart';
import 'package:pet_shelter/repository/local_storage.dart';
import 'package:pet_shelter/repository/shared_preferences_storage.dart';
import 'package:pet_shelter/services/basic_network_service.dart';
import 'package:pet_shelter/services/http_network_service.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

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

    return ChangeNotifierProvider<AppState>(
        create: (_) => AppState(GetIt.instance.get<LocalStorage>()),
        child: Consumer<AppState>(builder:(_, value, child) {
          return MaterialApp.router(
              title: 'Pet Shelter',
              theme: ThemeData(primarySwatch: Colors.blue),
              routeInformationParser: const RoutemasterParser(),
              routerDelegate: RoutemasterDelegate(
                  routesBuilder: ((BuildContext delegateContext) {
                    return Provider.of<AppState>(delegateContext).isAuthorized()
                        ? Routes.authorizedRouteMap
                        : Routes.unauthorizedRouteMap;
                  })
              )
          );
        })
    );
  }
}