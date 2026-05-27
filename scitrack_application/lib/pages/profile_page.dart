import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

import '../services/auth_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final institutionController = TextEditingController();

  final areaController = TextEditingController();

  final emailController = TextEditingController();

  bool isLoading = true;

  //
  // CARREGAR DADOS
  //
  Future<void> loadUserData() async {
    final user = await AuthService.getUserData();

    nameController.text = user['name'] ?? '';

    institutionController.text = user['institution'] ?? '';

    areaController.text = user['researchArea'] ?? '';

    emailController.text = user['email'] ?? '';

    setState(() {
      isLoading = false;
    });
  }

  //
  // SALVAR ALTERAÇÕES
  //
  Future<void> saveProfile() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    await AuthService.updateProfile(
      name: nameController.text,

      institution: institutionController.text,

      researchArea: areaController.text,

      email: emailController.text,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Perfil atualizado')));
  }

  @override
  void initState() {
    super.initState();

    loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Pesquisador'),

        backgroundColor: Colors.purple,

        foregroundColor: Colors.white,
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),

                child: Form(
                  key: _formKey,

                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,

                        backgroundColor: Colors.purple,

                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 30),

                      CustomTextField(
                        label: 'Nome completo',

                        icon: Icons.person,

                        controller: nameController,
                      ),

                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'Instituição',

                        icon: Icons.school,

                        controller: institutionController,
                      ),

                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'Área de pesquisa',

                        icon: Icons.science,

                        controller: areaController,
                      ),

                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'E-mail',

                        icon: Icons.email,

                        controller: emailController,
                      ),

                      const SizedBox(height: 30),

                      CustomButton(
                        text: 'Salvar Alterações',

                        onPressed: saveProfile,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
