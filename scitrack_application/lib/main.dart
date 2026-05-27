import 'package:flutter/material.dart';
import 'package:scitrack_application/pages/experiment_register_page.dart';
import 'package:scitrack_application/pages/experiments_list_page.dart';
import 'package:scitrack_application/pages/home_page.dart';
import 'package:scitrack_application/pages/login_page.dart';
import 'package:scitrack_application/pages/perfil_page.dart';
import 'package:scitrack_application/pages/register_page.dart';
import 'package:scitrack_application/routes/app_routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'SciTrack',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),

      // Tela inicial do aplicativo
      initialRoute: AppRoutes.login,

      // Rotas do aplicativo
      routes: {
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.register: (context) => const RegisterPage(),
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.perfil: (context) => const PerfilPage(),
        AppRoutes.experimentRegister: (context) => const ExperimentRegisterPage(),
        AppRoutes.experimentLister: (context) => const ExperimentsListPage(),
      },
    );
  }
}

