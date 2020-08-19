// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../infrastructure/core/api/api.dart';
import '../../infrastructure/core/api/api_dev.dart';
import '../../infrastructure/core/api/api_prod.dart';
import '../../infrastructure/auth/auth_repository.dart';
import '../../application/auth/auth_state.dart';
import '../env/environment_config.dart';
import '../env/environment_dev.dart';
import '../env/environment_prod.dart';
import '../global_config.dart';
import '../../infrastructure/home/home_local_repository.dart';
import '../../infrastructure/home/home_repository.dart';
import '../../application/home/home_state.dart';
import '../../infrastructure/user/user_repository.dart';

/// Environment names
const _prod = 'prod';
const _dev = 'dev';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<Api>(() => ApiProd(), registerFor: {_prod});
  gh.factory<Api>(() => ApiDev(), registerFor: {_dev});
  gh.factory<AuthRepository>(() => AuthRepository(get<Api>()));
  gh.lazySingleton<AuthState>(() => AuthState(get<AuthRepository>()));
  gh.factory<EnvironmentConfig>(() => EnvironmentDev(), registerFor: {_dev});
  gh.factory<EnvironmentConfig>(() => EnvironmentProd(), registerFor: {_prod});
  gh.lazySingleton<HomeLocalRepository>(() => HomeLocalRepository());
  gh.lazySingleton<HomeRepository>(() => HomeRepository(get<Api>()));
  gh.lazySingleton<UserRepository>(() => UserRepository(get<Api>()));

  // Eager singletons must be registered in the right order
  gh.singleton<GlobalConfig>(GlobalConfig());
  gh.singletonAsync<HomeState>(() => HomeState.load());
  return get;
}
