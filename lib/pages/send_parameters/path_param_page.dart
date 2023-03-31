import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PathParamPage extends StatelessWidget {
  const PathParamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Path Param Page'),
        //Esse tipo de parametro é mais utilziado na web e diz quando quero um param obrigatório
        //e quero forçar o dev a enviar um valor em específico. diferente do argument que pode ser opcional
      ),
      body: Center(child: Text(Get.parameters['name']!)),
      //aqui podemos forçar pq não funcionará caso não tenha o nome, venha nulo
    );
  }
}
