// ignore_for_file: unnecessary_null_comparison, prefer_const_declarations

import 'dart:convert';
import 'package:api_app/model/Character.dart';
import 'package:api_app/services/constants.dart';
import 'package:http/http.dart' as http;

class CharacterService {
  Future<List<Character>> fetchCharacters(int page, int pageSize) async {
    final offset = (page - 1) * pageSize;
    final url = '$characters_URL&limit=$pageSize&offset=$offset';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['data']['results'] as List;
      return results.map((character) => Character.fromJson(character)).toList();
    } else {
      throw Exception('Error fetching characters');
    }
  }

  Future<Character> fetchIronman() async {
    const ironmanUrl = '$ironman_URL?name=Iron Man&$key';
    final response = await http.get(Uri.parse(ironmanUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['data']['results'] as List;
      if (results.isNotEmpty) {
        return Character.fromJson(results[0]);
      } else {
        throw Exception('Iron Man not found');
      }
    } else {
      throw Exception('Error fetching Iron Man');
    }
  }

  Future<Character> fetchSpiderman() async {
    const spidermanUrl = '$spider_URL?nameStartsWith=Spider&$key';
    final response = await http.get(Uri.parse(spidermanUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['data']['results'] as List;
      if (results.isNotEmpty) {
        return Character.fromJson(results[0]);
      } else {
        throw Exception('Spiderman not found');
      }
    } else {
      throw Exception('Error fetching Spiderman');
    }
  }

  Future<Character> fetchVenom() async {
    const venomUrl = '$venom_URL?nameStartsWith=Veno&$key';
    final response = await http.get(Uri.parse(venomUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['data']['results'] as List;
      if (results.isNotEmpty) {
        return Character.fromJson(results[0]);
      } else {
        throw Exception('Venom not found');
      }
    } else {
      throw Exception('Error fetching Venom');
    }
  }
}
