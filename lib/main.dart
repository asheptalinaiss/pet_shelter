import 'package:flutter/material.dart';
import 'package:pet_shelter/login/views/login.dart';

void main() {
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