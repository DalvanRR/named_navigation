import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AndroidPage extends StatelessWidget {
  AndroidPage({Key? key, this.parameters}) : super(key: key);
  Map<String, String>? parameters;

  @override
  Widget build(BuildContext context) {
    debugPrint(this.parameters.toString());
    return Scaffold(body: Center(child: Text(Get.arguments['id'] ?? 'Sem ID')));
  }
}
