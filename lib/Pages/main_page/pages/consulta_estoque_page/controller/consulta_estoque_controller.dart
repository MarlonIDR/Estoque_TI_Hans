import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:teste/BD/connect_b4a.dart';
import 'package:teste/model/item_model.dart';

Future<List<ItemModel>> ConsultaEstoque () async{
    await initB4A();

    // Assuming you have a Parse SDK for Dart, otherwise replace with your DB logic
    final bdTi = ParseObject('BD_Ti');
    final query = QueryBuilder<ParseObject>(bdTi)
      ..orderByDescending('createdAt')
      ..setLimit(1000);
    
    final List<ParseObject> response = await query.find();
    final List<ItemModel> items = [];
    for (var item in response) {
      items.add(ItemModel.fromJson(item as Map<String, dynamic>));
    }
    return items;

    
}