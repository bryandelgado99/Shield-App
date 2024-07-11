import 'package:flutter/material.dart';

class Cardskelleton extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  const Cardskelleton({
    super.key,
    required this.title,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15.0), // Radio del borde de la tarjeta
        ),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(15.0), // Radio del borde de la tarjeta
          child: Container(
            height: 200.0, // Altura definida
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(15.0), // Radio del borde de la tarjeta
              image: DecorationImage(
                image: AssetImage(imagePath),
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white, // Color del texto
                  fontSize: 20.0, // Tamaño del texto
                  fontWeight: FontWeight.bold, // Grosor del texto
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
