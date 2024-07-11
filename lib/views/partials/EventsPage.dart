import 'package:flutter/material.dart';

class Eventspage extends StatelessWidget {
  const Eventspage({super.key});

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
          "Eventos Importantes",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text("Próximamente", style: TextStyle(fontSize: 20),),
      ),
    );
  }
}