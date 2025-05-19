import 'package:flutter/material.dart';
import 'package:teste/Pages/main_page/pages/consulta_estoque_page/controller/consulta_estoque_controller.dart';
    
class ConsultaEstoquePage extends StatefulWidget {
  const ConsultaEstoquePage({super.key});

  @override
  _ConsultaEstoquePageState createState() => _ConsultaEstoquePageState();
}


class _ConsultaEstoquePageState extends State<ConsultaEstoquePage> {

   @override
  void initState() {
    super.initState();
    var consultaEstoque = ConsultaEstoque();

      debugPrint(consultaEstoque.toString());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}