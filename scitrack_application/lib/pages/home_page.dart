import 'package:flutter/material.dart';

import '../widgets/home_card.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text('SciTrack'),

        centerTitle: true,

        backgroundColor: Colors.blue,

        foregroundColor: Colors.white,
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(

              'Painel do Pesquisador',

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Gerencie seus experimentos científicos',
            ),

            const SizedBox(height: 30),

            Expanded(

              child: GridView.count(

                crossAxisCount: 2,

                crossAxisSpacing: 16,
                mainAxisSpacing: 16,

                children: [

                  HomeCard(

                    title: 'Cadastrar\nExperimento',

                    icon: Icons.add_circle,

                    color: Colors.blue,

                    onTap: () {

                      // Navegar
                    },
                  ),

                  HomeCard(

                    title: 'Exibir\nExperimentos',

                    icon: Icons.list_alt,

                    color: Colors.green,

                    onTap: () {

                      // Navegar
                    },
                  ),

                  HomeCard(

                    title: 'Editar\nExperimentos',

                    icon: Icons.edit,

                    color: Colors.orange,

                    onTap: () {

                      // Navegar
                    },
                  ),

                  HomeCard(

                    title: 'Excluir\nExperimentos',

                    icon: Icons.delete,

                    color: Colors.red,

                    onTap: () {

                      // Navegar
                    },
                  ),

                  HomeCard(

                    title: 'Visualizar\nPerfil',

                    icon: Icons.person,

                    color: Colors.purple,

                    onTap: () {

                      // Navegar
                    },
                  ),

                  HomeCard(

                    title: 'Sair',

                    icon: Icons.logout,

                    color: Colors.black87,

                    onTap: () {

                      Navigator.pushReplacementNamed(
                        context,
                        '/login',
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}