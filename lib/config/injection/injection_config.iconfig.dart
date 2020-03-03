// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:challenge/core/api/api_dev.dart';
import 'package:challenge/core/api/api.dart';
import 'package:challenge/core/api/api_prod.dart';
import 'package:challenge/User/repositories/user_repository.dart';
import 'package:challenge/General/Auth/repositories/auth_repository.dart';
import 'package:challenge/General/Auth/state/auth_store.dart';
import 'package:challenge/General/Home/repositories/home_repository.dart';
import 'package:challenge/General/Home/state/home_store.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<UserRepository>(() => UserRepository(
        g<Api>(),
      ));
  g.registerFactory<AuthRepository>(() => AuthRepository(
        g<Api>(),
      ));
  g.registerFactory<AuthStore>(() => AuthStore(
        g<AuthRepository>(),
      ));
  g.registerFactory<HomeRepository>(() => HomeRepository(
        g<Api>(),
      ));
  g.registerFactory<HomeStore>(() => HomeStore(
        g<HomeRepository>(),
      ));

  //Register dev Dependencies --------
  if (environment == 'dev') {
    g.registerFactory<Api>(() => ApiDev());
  }

  //Register prod Dependencies --------
  if (environment == 'prod') {
    g.registerFactory<Api>(() => ApiProd());
  }
}
