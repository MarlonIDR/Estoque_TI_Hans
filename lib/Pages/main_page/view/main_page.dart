import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:teste/Pages/Login/view/login_page.dart';
import 'package:teste/Pages/main_page/pages/consulta_estoque_page/view/consulta_estoque_page.dart';
import 'package:teste/Pages/main_page/pages/home_page/view/home_page.dart';
import 'package:teste/model/user_model.dart';

class MainPage extends StatefulWidget {
  final UserModel userLogged;
  const MainPage({super.key, required this.userLogged});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  Timer? sessionChecker;

  final List<Widget> _pages = [
    const HomePage(),
    const ConsultaEstoquePage(),
  ];

  void _onSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    startSessionValidationTimer();
  }

  void startSessionValidationTimer() {
    sessionChecker = Timer.periodic(const Duration(seconds: 10), (_) async {
      final currentUser = await ParseUser.currentUser() as ParseUser?;

      if (currentUser != null && currentUser.sessionToken != null) {
        final response =
            await ParseUser.getCurrentUserFromServer(currentUser.sessionToken!);
        if (!response!.success || response.result == null) {
          await currentUser.logout();
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sessão expirada. Faça login novamente.'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
            // Aguardar a exibição do snackbar antes de redirecionar
            Future.delayed(const Duration(seconds: 3), () {
              if (mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (_) => const LoginPage(title: 'Login')),
                  (route) => false,
                );
              }
            });
          }
        }
      }
    });
  }

  @override
  void dispose() {
    sessionChecker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => _onSelect(0),
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Consulta Estoque'),
              onTap: () => _onSelect(1),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
