import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navega para Perfil
            Navigator.pushNamed(context, '/perfil');
          },
          child: const Text('Ir para Perfil'),
        ),
      ),
    );
  }
}