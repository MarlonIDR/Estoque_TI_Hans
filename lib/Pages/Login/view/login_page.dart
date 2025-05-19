// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:teste/Pages/Login/controller/login_controller.dart';
import 'package:teste/Pages/main_page/view/main_page.dart';
import 'package:teste/Pages/splash_page/view/splash_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool isLoading;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/frigor_hans_vetor.png',
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Usuário',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                isLoading
                    ? CircularProgressIndicator(
                        color: Colors.blue[800],
                      )
                    : GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            var auth = await doUserLogin(
                                usernameController.text,
                                passwordController.text);

                            String user = auth.name;

                            if (user != '') {
                              setState(() {
                                isLoading = false;
                              });
                              SnackBar snackBar = const SnackBar(
                                content: Text('Login successful'),
                                duration: Duration(seconds: 2),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SplashPage(
                                    userLogged: auth,
                                  ),
                                ),
                              );
                            } else if (user == '') {
                              setState(() {
                                isLoading = false;
                              });
                              SnackBar snackBar = const SnackBar(
                                content: Text('Login failed'),
                                duration: Duration(seconds: 2),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              SnackBar snackBar = const SnackBar(
                                content: Text('ERRO.'),
                                duration: Duration(seconds: 2),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          } catch (e) {
                            setState(() {
                              isLoading = false;
                            });
                            SnackBar snackBar = SnackBar(
                              content: Text(e.toString()),
                              duration: const Duration(seconds: 2),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Container(
                          height: size.height * 0.06,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.red[800],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height * 0.025,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
