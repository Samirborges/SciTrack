import 'package:flutter/material.dart';
import 'package:scitrack_application/pages/experiment_details_page.dart';
import 'package:scitrack_application/routes/app_routes.dart';

import '../services/experiment_service.dart';

class ExperimentsListPage extends StatefulWidget {
  const ExperimentsListPage({super.key});

  @override
  State<ExperimentsListPage> createState() => _ExperimentsListPageState();
}

class _ExperimentsListPageState extends State<ExperimentsListPage> {
  List<Map<String, dynamic>> experiments = [];

  bool isLoading = true;

  //
  // CARREGAR EXPERIMENTOS
  //
  Future<void> loadExperiments() async {
    final data = await ExperimentService.getExperiments();

    setState(() {
      experiments = data;

      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    loadExperiments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experimentos'),

        backgroundColor: Colors.green,

        foregroundColor: Colors.white,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(
              context, 
              AppRoutes.home
            );
          },
        ), 
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : experiments.isEmpty
          ? const Center(child: Text('Nenhum experimento cadastrado'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),

              itemCount: experiments.length,

              itemBuilder: (context, index) {
                final experiment = experiments[index];

                return Card(
                  elevation: 3,

                  margin: const EdgeInsets.only(bottom: 16),

                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),

                    leading: const Icon(
                      Icons.science,
                      color: Colors.green,
                      size: 40,
                    ),

                    title: Text(
                      experiment['title'],

                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const SizedBox(height: 8),

                        Text('Área: ${experiment['scientificArea']}'),

                        Text('Status: ${experiment['status']}'),
                      ],
                    ),

                    trailing: const Icon(Icons.arrow_forward_ios),

                    onTap: () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) => ExperimentDetailsPage(
                            experiment: experiment,
                            index: index,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
