// ignore_for_file: avoid_unnecessary_containers, unused_import, avoid_print, unnecessary_null_comparison, use_super_parameters, prefer_const_constructors
import 'package:api_app/model/Character.dart';
import 'package:api_app/views/components/SpecialCards.dart';
import 'package:api_app/views/components/categoryCards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/CharacterService.dart';

class Listapage extends StatefulWidget {
  const Listapage({Key? key}) : super(key: key);

  @override
  State<Listapage> createState() => _ListapageState();
}

class _ListapageState extends State<Listapage> {
  late Character? ironman;
  late Character? spiderman;
  late Character? venom;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCharacters();
  }

  Future<void> _fetchCharacters() async {
    try {
      ironman = await CharacterService().fetchIronman();
      spiderman = await CharacterService().fetchSpiderman();
      venom = await CharacterService().fetchVenom();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching characters: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 165, 42, 33),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          title: const Text(
            "Shield-Pad",
            style: TextStyle(color: Colors.white),
          ),
          leading: Image.asset(
            'assets/marvel-shield-svgrepo-com.png',
            scale: 8,
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: bodyPage(),
        ),
      ),
    );
  }

  Widget bodyPage() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Categorías",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10,),
            Categorycards(),
            const SizedBox(height: 25,),
            const Text(
              "Personajes Aleatorios",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            if (ironman != null && ironman!.description.isNotEmpty) CharacterCard(ironman!).buildCard(),
            if (spiderman != null && spiderman!.description.isNotEmpty) CharacterCard(spiderman!).buildCard(),
            if (venom != null && venom!.description.isNotEmpty) CharacterCard(venom!).buildCard(),
          ],
        ),
      );
    }
  }
}