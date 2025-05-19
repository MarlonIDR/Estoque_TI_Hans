// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:teste/Pages/Login/view/login_page.dart';
import 'package:teste/Pages/main_page/view/main_page.dart';
import 'package:teste/Pages/splash_page/controller/splash_page_controller.dart';
import 'package:teste/model/user_model.dart';

class SplashPage extends StatefulWidget {
  final UserModel userLogged;
  const SplashPage({super.key, required this.userLogged});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int check = 0;
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    int checklogin = await checkLogin();

    if (checklogin == 0) {
      _goToLogin();
    } else if (checklogin == 1) {
      _goToMain();
    } else {
      _goToLogin();
    }
  }

  void _goToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const LoginPage(
          title: 'Login',
        ),
      ),
    );
  }

  void _goToMain() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => MainPage(
          userLogged: widget.userLogged,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );
  }
}
