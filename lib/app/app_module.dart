import 'package:dio/dio.dart';
import 'package:search_cep/app/modules/cep/cep_repository.dart';
import 'package:search_cep/app/modules/cep/cep_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/cep/cep_page.dart';
// import 'modules/home/home_module.dart';
import 'modules/home/home_page.dart';
import 'modules/home/home_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => Dio()),
    
    // CepRepository recebe o Dio
    Bind.factory((i) => CepRepository(i())),
    
    Bind.lazySingleton((i) => HomeStore()),
    
    // CepStore recebe o CepRepository
    Bind.lazySingleton((i) => CepStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    // ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ChildRoute('/', child: (context, args) => const HomePage()),
    ChildRoute('/cep', child: (context, args) => const CepPage()),
  ];
}
