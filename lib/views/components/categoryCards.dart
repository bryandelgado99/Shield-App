// ignore_for_file: use_build_context_synchronously
import 'package:api_app/views/components/cardSkelleton.dart';
import 'package:api_app/views/partials/CharactersPage.dart';
import 'package:api_app/views/partials/ComicsPage.dart';
import 'package:api_app/views/partials/EventsPage.dart';
import 'package:flutter/material.dart';

class Categorycards extends StatelessWidget {
  const Categorycards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: Cardskelleton(
            title: 'Personajes',
            imagePath: 'assets/heores.jpg',
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Characterspage()),
              );
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Cardskelleton(
            title: 'Comics',
            imagePath: 'assets/comics.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Comicspage()),
              );
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Cardskelleton(
            title: 'Eventos',
            imagePath: 'assets/villanos.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Eventspage()),
              );
            },
          ),
        ),
      ],
    );
  }
}
