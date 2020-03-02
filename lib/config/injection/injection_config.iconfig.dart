// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:challenge/core/api/api_dev.dart';
import 'package:challenge/core/api/api.dart';
import 'package:challenge/core/api/api_prod.dart';
import 'package:challenge/User/repositories/user_repository.dart';
import 'package:challenge/General/Auth/repository/auth_repository.dart';
import 'package:challenge/General/Auth/store/auth_store.dart';
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

  //Register dev Dependencies --------
  if (environment == 'dev') {
    g.registerFactory<Api>(() => ApiDev());
  }

  //Register prod Dependencies --------
  if (environment == 'prod') {
    g.registerFactory<Api>(() => ApiProd());
  }
}
