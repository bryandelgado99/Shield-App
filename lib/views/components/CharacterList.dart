// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, unnecessary_null_comparison, use_key_in_widget_constructors

import 'package:api_app/provider/CharaterProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final characterProvider = Provider.of<CharacterProvider>(context, listen: true);

    // Cargar los primeros personajes al iniciar la aplicación
    WidgetsBinding.instance.addPostFrameCallback((_) {
      characterProvider.loadInitialCharacters();
    });

    return Consumer<CharacterProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading && provider.characters.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else if (provider.characters.isEmpty) {
          return Center(child: Text('No characters found.'));
        }

        // Filtrar los personajes que tienen descripción válida y no contienen "image_not_available" en el thumbnail
        final filteredCharacters = provider.characters.where((character) {
          return character.description != null &&
              character.description.isNotEmpty &&
              !character.thumbnail.contains("image_not_available");
        }).toList();

        if (filteredCharacters.isEmpty) {
          return Center(child: Text('No characters with description available.'));
        }

        return ListView.builder(
          itemCount: filteredCharacters.length,
          itemBuilder: (context, index) {
            final character = filteredCharacters[index];
            return Card(
              margin: EdgeInsets.all(10.0),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(child: Image.network(character.thumbnail, fit: BoxFit.cover,)),
                    SizedBox(height: 10.0),
                    Text(
                      character.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      character.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}