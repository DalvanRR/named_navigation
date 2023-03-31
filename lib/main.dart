import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_named_routes/pages/home_page.dart';
import 'package:get_named_routes/pages/init/init/init_page1.dart';
import 'package:get_named_routes/pages/middleweares/acess_denied_page.dart';
import 'package:get_named_routes/pages/middleweares/middlewares_home_page.dart';
import 'package:get_named_routes/pages/middleweares/route_middlewares.dart';
import 'package:get_named_routes/pages/nested_navigation/home_nested_navigation.dart';
import 'package:get_named_routes/pages/not_found_route/not_found_route_page.dart';
import 'package:get_named_routes/pages/send_parameters/arguments_param_page.dart';
import 'package:get_named_routes/pages/send_parameters/path_param_page.dart';
import 'package:get_named_routes/pages/send_parameters/query_param_page.dart';
import 'package:get_named_routes/pages/send_parameters/send_parameters_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      unknownRoute: GetPage(
        name: '/404 Not found',
        page: () => const NotFoundRoutePage(),
      ),
      initialRoute: '/home',
      routingCallback: (Routing? routing) {
        // routingCallback é um middlewares para escurar rotas, observador geral
        debugPrint(routing?.current);
        debugPrint(routing?.previous);
        // Além destes há uma série de outras opções para escutar rotas, é um analyics dentro do getx
      },
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomePage(),
        ),
        GetPage(
            name: '/init/page1',
            page: () => const InitPage1(),
            middlewares: [
              RouteMiddlewares(),
            ]),
        GetPage(
          name: '/sendParameters',
          page: () => const SendParametersHomePage(),
          children: [
            GetPage(
              name: '/arguments',
              page: () => const ArgumentsParamPage(),
            ),
            GetPage(
              name: '/pathParam/:name/jornadaGetx',
              // aqui eu só chego na url desejada se enviar um nome,do contrário ele não acha a rota
              page: () => const PathParamPage(),
            ),
            GetPage(
              name: '/queryParam',
              page: () => const QueryParamPage(),
            ),
          ],
        ),
        GetPage(
            name: '/middlewares',
            page: () => MiddlewaresHomePage(),
            middlewares: [
              RouteMiddlewares(),
            ]
            //diferente do route callback aqui ele vai olhar somente esta rota
            //posso definir a ordem de prioridades de excecução não necessariamente respeitando a ordem doa array
            ),
        GetPage(
          name: '/acessDenied',
          page: () => const AcessDeniedPage(),
        ),
        GetPage(
          name: '/nestedNavigation',
          page: () => HomeNestedNavigation(),
        ),
      ],
    );
  }
}
