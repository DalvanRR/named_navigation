import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/init/page1');
              },
              child: const Text('Inicial'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/notExistPage');
              },
              child: const Text('Not Exist Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/sendParameters');
              },
              child: const Text('Send Parameters'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/middlewares');
              },
              child: const Text('Middlewares'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/nestedNavigation');
              },
              child: const Text('Nested Navigation'),
            ),
          ],
        ),
      ),
    );
  }
}
