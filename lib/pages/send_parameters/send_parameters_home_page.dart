import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendParametersHomePage extends StatelessWidget {
  const SendParametersHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Parameters Home Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/sendParameters/arguments', arguments: {
                'curso': 'jornada Getx',
                'name': 'Dalvan Rech',
              });
              // aqui eu poderia também passar vários arguments juntos criando um map, ou uma lista, até mesmo um objeto
              // e passando ele na arguments param page
            },
            child: const Text('Arguments'),
          ),
          ElevatedButton(
            onPressed: () {
              final param = Uri.encodeFull('Dalvan Rech');
              Get.toNamed('/sendParameters/pathParam/$param/jornadaGetx');
              //No pathParam não podemos mandar parametros com espaços no meio
              //Na web o browser faz isso automaticamente. para evitar isso usamos o encodeFull
            },
            child: const Text('Path Param'),

            // Usamos quando precisamos que esse parametro seja enviado, que envie o nome, por exemplo
            // Quando o param em questão é importante e precisamos forçar
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(
                  '/sendParameters/queryParam?name=Dalvan Rech&id=12&curso=jornada Getx');
              // como estão nomeadas posso passar com espaços
            },
            child: const Text('Query Param'),
            //Usamos para parametros opcionais. Podem ou não ser enviados
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/sendParameters/queryParam', parameters: {
                'name': 'Dalvan Rech',
                'id': '12',
                'curso': 'jornada Getx'
              });
            },

            // assim delegamos para o próprio GetX fazer colocar params e montar a url
            child: const Text('Query Param(parâmetros)'),
          ),
        ],
      )),
    );
  }
}

// argument params podem existir ou não, são opcionais e conseguirei acessar a url de qualquer forma  
// path params não podemos acessar a url se não enviar o Parametro
// query params são opcinais e normalemnte usados em locais com filtros
// por exemplo nome, id e curso. podendo mandar1 ou mais de 1