import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:teste/BD/connect_b4a.dart';
import 'package:teste/model/user_model.dart';

Future<UserModel> doUserLogin(String username, String password) async {
  final isInitialized = await initB4A();

  debugPrint('B4A initialized: $isInitialized');

  final user = ParseUser(username, password, null);

  final response = await user.login();

  if (response.success) {
    debugPrint('Login successful: ${response.result}');

    final id = response.result['objectId'];
    final name = response.result['username'];
    final email = response.result['email'];

    final userLogged = UserModel(id: id, name: name, email: email);

    debugPrint('NOME: ${userLogged.name}');
    debugPrint('ID: ${userLogged.id}');
    debugPrint('EMAIL: ${userLogged.email}');

    return userLogged;
  } else {
    debugPrint('Login failed: ${response.error?.message}');

    throw Exception('${response.error?.message}');
  }
}
