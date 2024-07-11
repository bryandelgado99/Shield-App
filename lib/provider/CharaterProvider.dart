// ignore_for_file: prefer_final_fields, avoid_print

import 'package:api_app/model/Character.dart';
import 'package:api_app/services/CharacterService.dart';
import 'package:flutter/material.dart';

class CharacterProvider with ChangeNotifier {
  List<Character> _characters = [];
  bool _isLoading = false;
  int _currentPage = 1; // Página inicial para la carga de datos
  final int _charactersPerPage = 20; // Número de personajes por página
  final CharacterService _characterService = CharacterService();

  List<Character> get characters => _characters;
  bool get isLoading => _isLoading;

  Future<void> fetchCharacters() async {
    if (_isLoading) return; // Evitar llamadas simultáneas

    _isLoading = true;
    notifyListeners();

    try {
      final characters = await _characterService.fetchCharacters(_currentPage, _charactersPerPage);
      _characters.addAll(characters);
      _currentPage++; // Avanzar a la siguiente página
    } catch (e) {
      print('Error fetching characters: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Método para cargar los primeros personajes al iniciar la aplicación
  Future<void> loadInitialCharacters() async {
    await fetchCharacters(); // Llamar al método para cargar los personajes
  }
}