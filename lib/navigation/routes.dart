import 'package:flutter/material.dart';
import 'package:pet_shelter/views/auth/auth_widget.dart';
import 'package:pet_shelter/views/create_ad/create_ad_container_widget.dart';
import 'package:pet_shelter/views/feed/feed_widget.dart';
import 'package:pet_shelter/views/main_screen_widget.dart';
import 'package:pet_shelter/views/profile/profile_widget.dart';
import 'package:routemaster/routemaster.dart';

class Routes {
  static final unauthorizedRouteMap = RouteMap(
      routes: {
        '/': (_) => const MaterialPage(child: AuthWidget())
      }
  );

  static final authorizedRouteMap = RouteMap(
      routes: {
        '/': (_) => const CupertinoTabPage(
            child: MainScreenWidget(),
            paths: [
              '/feed',
              '/create_ad',
              '/profile'
            ]
        ),
        '/feed': (route) => const MaterialPage(child: FeedWidget()),
        '/create_ad': (route) => const MaterialPage(child: CreateAdContainerWidget()),
        '/profile': (route) => const MaterialPage(child: ProfileWidget())
      }
    );
}