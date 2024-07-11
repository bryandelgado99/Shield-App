// ignore_for_file: unused_local_variable, dead_code

import 'package:api_app/views/listpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() async {
    await Future.delayed(const Duration(seconds: 10));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(232, 255, 82, 82),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/marvel-shield-svgrepo-com (1).png',
                color: Colors.white,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                height: MediaQuery.of(context).size.height / 2.5,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Bienvenidos a Shield Pad",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      const Text(
                        "Tu lugar confiable para consultar infomarción sobre tus personajes de Marvel favoritos.",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 25),
                      isLoading
                          ? const CircularProgressIndicator()
                          : 
                          ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Listapage()));
                          },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image.asset(
                                    'assets/marvel-captainamerica-svgrepo-com.png',
                                    scale: 5,
                                    color: const Color.fromARGB(255, 126, 39, 32),
                                  ),
                                  const Text("Empecemos")
                                ],
                              )
                            )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
