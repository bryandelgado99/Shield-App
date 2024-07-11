// ignore_for_file: library_private_types_in_public_api

import 'package:api_app/provider/CharaterProvider.dart';
import 'package:api_app/views/components/CharacterList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Characterspage extends StatefulWidget {
  const Characterspage({super.key});

  @override
  _CharacterspageState createState() => _CharacterspageState();
}

class _CharacterspageState extends State<Characterspage> {
  @override
  void initState() {
    super.initState();
    // Llama a fetchCharacters cuando se construya la página
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CharacterProvider>(context, listen: false).fetchCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 42, 33),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        title: const Text(
          "Personajes",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: CharacterList(),
    );
  }
}