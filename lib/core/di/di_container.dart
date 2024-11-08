import 'package:e_mobi/core/network/network_info.dart';
import 'package:e_mobi/views/features/authentication/data/datasources/remote_authentication_data_source.dart';
import 'package:e_mobi/views/features/authentication/presenentation/blocs/authentication/authentication_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../views/features/authentication/data/repositories/authentication_repository_impl.dart';
import '../../views/features/authentication/domain/repositories/authentication_repository.dart';
import '../../views/features/authentication/domain/usecases/authentication_usecase.dart';

final getIt = GetIt.instance;

Future<void> initializeDepencyInjection() async {
  getIt.registerLazySingleton(() => AuthenticationBloc());

  //*EXTERNAL
  getIt.registerLazySingleton(() => http.Client());

  getIt.registerLazySingleton(() => InternetConnectionChecker());

  //CORE
  getIt.registerLazySingleton<NetWorkInfoImpl>(
      () => NetWorkInfoImpl(connectionChecker: getIt()));

  getIt.registerLazySingleton<RemoteAuthenticationDataSourceImpl>(
    () => RemoteAuthenticationDataSourceImpl(
      client: getIt(),
      netWorkInfoI: getIt(),
    ),
  );

  getIt.registerLazySingleton<IAuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(
          remoteAuthenticationDataSourceImpl: getIt()));

  // UseCases
  getIt.registerLazySingleton<AuthenticateUseCase>(
      () => AuthenticateUseCase(getIt()));
}
