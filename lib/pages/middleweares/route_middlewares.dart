import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteMiddlewares extends GetMiddleware {
  RouteMiddlewares({super.priority});

//Com esse tracking conseguimos ver no debugConsole a ordenação da excecução das rotas

  @override
  //usamos este metodo quando a rota é invocada, antes mesmo de ser chamada
  GetPage? onPageCalled(GetPage? page) {
    debugPrint('Executando middlewares onPageCalled');
    return super.onPageCalled(page);
  }

  @override
  // Esse metodo é chamado logo o get do nosso page
  Widget onPageBuilt(Widget page) {
    debugPrint('Executando middlewares onPageBuilt');
    return Theme(
      data: ThemeData.dark(),
      child: page,
      // Aqui foi meio que encapsulado para que quando entre nesse contexto mude o tema. só essa
      // antes de acessar a página ele já faz a funcionalidade pedida
    );
  }

  @override
  // esse vai ser invocado antes mesmo de ir para a página
  // podemos usar para fazer uma validação
  RouteSettings? redirect(String? route) {
    if (route == '/init/page1') {
      return const RouteSettings(name: '/acessDenied');
    }
    // aqui posso fazer qualquer validação
    // No exemplo acima fiz um guard, que protege a página da vizualização, redirecionando para outra página por meio de rota
    return null;
    // tem que retornar null, do contrario da BO
  }

  @override
  // Esse é executado ao final de tudo
  // Podendo definir ações ao sair da página em questão
  void onPageDispose() {
    debugPrint('Executando middlewares onPageDispose');
    super.onPageDispose();
  }

  //Existem outros 'on' ainda que são utilizados para controles de dependecias associados a gerenciamento de rotas
  // Usar pensando que se pesar muito o onPageBuilt por exemplo, o app vai ficar lento
}
