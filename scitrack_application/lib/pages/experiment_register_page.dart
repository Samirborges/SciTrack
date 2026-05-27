import 'package:flutter/material.dart';
import 'package:scitrack_application/routes/app_routes.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

import '../services/experiment_service.dart';

class ExperimentRegisterPage extends StatefulWidget {
  const ExperimentRegisterPage({super.key});

  @override
  State<ExperimentRegisterPage> createState() => _ExperimentRegisterPageState();
}

class _ExperimentRegisterPageState extends State<ExperimentRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();

  final areaController = TextEditingController();

  final dateController = TextEditingController();

  final objectiveController = TextEditingController();

  final methodologyController = TextEditingController();

  final resultsController = TextEditingController();

  final statusController = TextEditingController();

  
  Future<void> saveExperiment() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    await ExperimentService.saveExperiment(
      data: {
        'title': titleController.text,

        'scientificArea': areaController.text,

        'startDate': dateController.text,

        'objective': objectiveController.text,

        'methodology': methodologyController.text,

        'results': resultsController.text,

        'status': statusController.text,
      },
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Experimento salvo com sucesso')),
    );

    Navigator.pushNamed(
      context, 
      AppRoutes.home
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Experimento'),

        backgroundColor: Colors.blue,

        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Form(
            key: _formKey,

            child: Column(
              children: [
                CustomTextField(
                  label: 'Título do experimento',

                  icon: Icons.science,

                  controller: titleController,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o título';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  label: 'Área científica',

                  icon: Icons.biotech,

                  controller: areaController,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a área científica';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  label: 'Data de início',

                  icon: Icons.date_range,

                  controller: dateController,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a data';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: objectiveController,

                  maxLines: 3,

                  decoration: const InputDecoration(
                    labelText: 'Objetivo do experimento',

                    border: OutlineInputBorder(),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o objetivo';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: methodologyController,

                  maxLines: 4,

                  decoration: const InputDecoration(
                    labelText: 'Metodologia utilizada',

                    border: OutlineInputBorder(),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a metodologia';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: resultsController,

                  maxLines: 4,

                  decoration: const InputDecoration(
                    labelText: 'Resultados obtidos',

                    border: OutlineInputBorder(),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe os resultados';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  label: 'Status da pesquisa',

                  icon: Icons.pending_actions,

                  controller: statusController,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o status';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        child: const Text('Voltar'),
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: CustomButton(
                        text: 'Salvar',
                        height: 34,
                        borderRadius: 100,
                        onPressed: saveExperiment,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
