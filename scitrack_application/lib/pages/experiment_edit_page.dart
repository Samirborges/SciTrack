import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

import '../services/experiment_service.dart';

class ExperimentEditPage extends StatefulWidget {
  final Map<String, dynamic> experiment;

  final int index;

  const ExperimentEditPage({
    super.key,
    required this.experiment,
    required this.index,
  });

  @override
  State<ExperimentEditPage> createState() => _ExperimentEditPageState();
}

class _ExperimentEditPageState extends State<ExperimentEditPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController titleController;

  late TextEditingController areaController;

  late TextEditingController dateController;

  late TextEditingController objectiveController;

  late TextEditingController methodologyController;

  late TextEditingController resultsController;

  late TextEditingController statusController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.experiment['title']);

    areaController = TextEditingController(
      text: widget.experiment['scientificArea'],
    );

    dateController = TextEditingController(
      text: widget.experiment['startDate'],
    );

    objectiveController = TextEditingController(
      text: widget.experiment['objective'],
    );

    methodologyController = TextEditingController(
      text: widget.experiment['methodology'],
    );

    resultsController = TextEditingController(
      text: widget.experiment['results'],
    );

    statusController = TextEditingController(text: widget.experiment['status']);
  }

  //
  // SALVAR ALTERAÇÕES
  //
  Future<void> saveChanges() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    await ExperimentService.updateExperiment(
      index: widget.index,

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

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Experimento atualizado')));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Experimento'),

        backgroundColor: Colors.orange,

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
                      return 'Informe a área';
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
                    labelText: 'Objetivo',

                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: methodologyController,

                  maxLines: 4,

                  decoration: const InputDecoration(
                    labelText: 'Metodologia',

                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: resultsController,

                  maxLines: 4,

                  decoration: const InputDecoration(
                    labelText: 'Resultados',

                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  label: 'Status da pesquisa',

                  icon: Icons.pending_actions,

                  controller: statusController,
                ),

                const SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,

                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },

                          child: const Text('Cancelar'),
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: CustomButton(
                        text: 'Salvar',
                        borderRadius: 100,
                        height: 48,

                        onPressed: saveChanges,
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
