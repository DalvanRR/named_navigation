import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_named_routes/pages/nested_navigation/pages/android_page.dart';
import 'package:get_named_routes/pages/nested_navigation/pages/apple_page.dart';

class HomeNestedNavigation extends StatelessWidget {
  final currentBottomIndex = 0.obs;

  HomeNestedNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nested Navigation')),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            currentIndex: currentBottomIndex.value,
            onTap: (value) {
              print(value);
              currentBottomIndex(value);
              switch (value) {
                case 0:
                  //Por ser aninhada passamos o ID para que entenda.
                  // Assim poderiamos ter id dentro de id dentro de id
                  // Os nomes de navegação podem ser os mesmo da não aninhada, não tem problema, não se atrapalham
                  Get.toNamed('/', id: 1);
                  break;
                case 1:
                  Get.toNamed(
                    '/android',
                    id: 1,
                    parameters: {'id': '123'},
                  );

                  break;
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.apple),
                label: 'Apple',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.android),
                label: 'Android',
              ),
            ],
          );
        },
      ),
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          Widget page;
          Transition transition;
          final regex = RegExp(r'(^\/[a-zA-Z0-9_/]+)(\?.*)($)');
          final match = regex.firstMatch(settings.name!);
          final parametersString = match?.group(2);
          String? routeName =
              settings.name?.replaceAll(parametersString ?? '', '');
          var uri = Uri.dataFromString('http://dalvan.elemesmo.com' +
              settings.name.toString()); //converts string to a uri
          Map<String, String> params = uri.queryParameters;
          debugPrint(params.toString());
          // return value of
          if (routeName == '/') {
            page = const ApplePage();
            transition = Transition.upToDown;
          } else if (routeName == '/android') {
            page = AndroidPage(
              parameters: params,
            );
            transition = Transition.downToUp;
          } else {
            page = const Center(child: Text('Not Found Page'));

            transition = Transition.fade;
          }

          return GetPageRoute(
            page: () => page,
            transition: transition,
          );
        },
      ),
    );
  }
}
