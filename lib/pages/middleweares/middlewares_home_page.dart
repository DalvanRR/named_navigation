import 'package:flutter/material.dart';

class MiddlewaresHomePage extends StatelessWidget {
  MiddlewaresHomePage({Key? key}) : super(key: key) {
    debugPrint('Criando página MiddlewaresHomePage');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Build página MiddlewaresHomePage');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Middlewares'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Botao',
              )),
        ));
  }
}
