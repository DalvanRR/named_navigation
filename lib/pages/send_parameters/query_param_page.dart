import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QueryParamPage extends StatelessWidget {
  const QueryParamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Path Param Page'),
      ),
      body: Center(
          child: Column(
        children: [
          Text(Get.parameters['name'] ?? 'Nome não encontrado'),
          Text(Get.parameters['id'] ?? 'Id não encontrado'),
          Text(Get.parameters['curso'] ?? 'Curso não encontrado'),
        ],
      )),
    );
  }
}
