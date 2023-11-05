import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebatecnica/src/api.dart';
import 'package:pruebatecnica/src/models/modelo_personaje.dart';
import 'package:pruebatecnica/src/pages/inicio.dart';
import 'package:pruebatecnica/src/models/modelo_usuario.dart';

void main() {
  final apiService = ApiService('https://rickandmortyapi.com/api');
  final characterModel = CharacterModel(); 
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel(apiService)),
        ChangeNotifierProvider.value(value: characterModel), 
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'rickAndMorty',
      home: Inicio(),
    );
  }
}