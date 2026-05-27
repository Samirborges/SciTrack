import 'package:flutter/material.dart';
import 'package:scitrack_application/pages/experiment_edit_page.dart';

import '../services/experiment_service.dart';

class ExperimentDetailsPage extends StatelessWidget {
  final Map<String, dynamic> experiment;

  final int index;

  const ExperimentDetailsPage({
    super.key,
    required this.experiment,
    required this.index,
  });

  //
  // ITEM VISUAL
  //
  Widget detailItem({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            title,

            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),

          const SizedBox(height: 6),

          Text(value, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }

  //
  // CONFIRMAR EXCLUSÃO
  //
  void deleteExperiment(BuildContext context) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text('Excluir Experimento'),

          content: const Text('Deseja realmente excluir este experimento?'),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text('Cancelar'),
            ),

            ElevatedButton(
              onPressed: () async {
                await ExperimentService.deleteExperiment(index);

                
                Navigator.pop(context);

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Experimento excluído')),
                );
              },

              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),

              child: const Text('Excluir'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Experimento'),

        backgroundColor: Colors.green,

        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            detailItem(
              title: 'Título do Experimento',
              value: experiment['title'],
            ),

            detailItem(
              title: 'Área Científica',
              value: experiment['scientificArea'],
            ),

            detailItem(title: 'Data de Início', value: experiment['startDate']),

            detailItem(title: 'Objetivo', value: experiment['objective']),

            detailItem(title: 'Metodologia', value: experiment['methodology']),

            detailItem(title: 'Resultados', value: experiment['results']),

            detailItem(title: 'Status', value: experiment['status']),

            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => ExperimentEditPage(
                            experiment: experiment, 
                            index: index
                          )
                        )
                      );
                    },

                    icon: const Icon(Icons.edit),

                    label: const Text('Editar'),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      deleteExperiment(context);
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white
                    ),

                    icon: const Icon(Icons.delete),

                    label: const Text('Excluir'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text('Voltar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
