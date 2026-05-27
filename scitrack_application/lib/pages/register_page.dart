import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/auth_header.dart';

import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() =>
      _RegisterPageState();
}

class _RegisterPageState
    extends State<RegisterPage> {

  final _formKey =
      GlobalKey<FormState>();

  final nameController =
      TextEditingController();

  final institutionController =
      TextEditingController();

  final areaController =
      TextEditingController();

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  Future<void> register() async {

    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    await AuthService.registerUser(

      email: emailController.text,
      password: passwordController.text,
    );

    if (!mounted) return; 

    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(
        content: Text(
          'Cadastro realizado',
        ),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(),

      body: SafeArea(

        child: SingleChildScrollView(

          padding:
              const EdgeInsets.all(24),

          child: Form(

            key: _formKey,

            child: Column(

              children: [

                const AuthHeader(),

                const SizedBox(height: 30),

                CustomTextField(
                  label: 'Nome completo',
                  icon: Icons.person,
                  controller:
                      nameController,
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  label: 'Instituição',
                  icon: Icons.school,
                  controller:
                      institutionController,
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  label: 'Área de pesquisa',
                  icon: Icons.science,
                  controller:
                      areaController,
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  label: 'E-mail',
                  icon: Icons.email,
                  controller:
                      emailController,
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  label: 'Senha',
                  icon: Icons.lock,
                  obscureText: true,
                  controller:
                      passwordController,
                ),

                const SizedBox(height: 30),

                CustomButton(
                  text: 'Cadastrar',
                  onPressed: register,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}