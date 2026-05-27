import 'package:flutter/material.dart';
import 'package:scitrack_application/services/auth_service.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/auth_header.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {

    if (!_formKey.currentState!.validate()) {
      return;
    }

    bool sucess = await AuthService.login(
      email: emailController.text, 
      password: passwordController.text
    );

    if (!mounted) return; 

    if(sucess) {
      Navigator.pushReplacementNamed(
        context, 
        '/home'
      );

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login inválido'),
        ),
      );
    }
  }
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Center(

          child: SingleChildScrollView(

            padding: const EdgeInsets.all(24),

            child: Form(

              key: _formKey,

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [

                  const AuthHeader(),

                  const SizedBox(height: 50),

                  CustomTextField(
                    label: 'E-mail',
                    icon: Icons.email_outlined,
                    controller: emailController,

                    validator: (value) {

                      if (value == null || value.isEmpty) {
                        return 'Informe seu e-mail';
                      }

                      if (!value.contains('@')) {
                        return 'E-mail inválido';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  CustomTextField(
                    label: 'Senha',
                    icon: Icons.lock_outline,
                    obscureText: true,
                    controller: passwordController,

                    validator: (value) {

                      if (value == null || value.isEmpty) {
                        return 'Informe sua senha';
                      }


                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  CustomButton(
                    text: 'Entrar',
                    onPressed: login,
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const Text(
                        'Não possui conta?',
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context, 
                            '/register'
                          );
                        },

                        child: const Text('Cadastre-se'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}