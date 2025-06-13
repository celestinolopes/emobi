import 'package:e_mobi/core/cep/data/datasource/remote_get_cep.dart';
import 'package:e_mobi/core/cep/data/repositories/cep_repository_impl.dart';
import 'package:e_mobi/core/cep/domain/repositories/i_get_cep_repository.dart';
import 'package:e_mobi/core/cep/domain/usecases/get_cep_usecase.dart';
import 'package:e_mobi/core/cep/presentation/bloc/cep_bloc.dart';
import 'package:e_mobi/core/network/network_info.dart';
import 'package:e_mobi/views/features/authentication/data/datasources/remote_authentication_data_source.dart';
import 'package:e_mobi/views/features/authentication/presenentation/blocs/authentication/authentication_bloc.dart';
import 'package:e_mobi/views/features/childrens/data/datasources/cadastro_aluno_datasource.dart';
import 'package:e_mobi/views/features/childrens/data/repositories/cadastro_aluno_repository_impl.dart';
import 'package:e_mobi/views/features/childrens/domain/repositories/cadastro_aluno_repository.dart';
import 'package:e_mobi/views/features/childrens/domain/usecases/cadastro_motorista_usecase.dart';
import 'package:e_mobi/views/features/childrens/domain/usecases/get_meus_filhos.dart';
import 'package:e_mobi/views/features/childrens/presentation/blocs/bloc/cadastro_aluno_bloc.dart';
import 'package:e_mobi/views/features/childrens/presentation/blocs/bloc/meus_filhos_bloc.dart';
import 'package:e_mobi/views/features/drivers/data/datasources/cadastro_motorista_datasource.dart';
import 'package:e_mobi/views/features/drivers/data/datasources/cadastro_veiculo_datasource.dart';
import 'package:e_mobi/views/features/drivers/data/repositories/cadastro_motorista_repository_impl.dart';
import 'package:e_mobi/views/features/drivers/data/repositories/cadastro_veiculo_repository_impl.dart';
import 'package:e_mobi/views/features/drivers/domain/repositories/cadastro_motorista_repository.dart';
import 'package:e_mobi/views/features/drivers/domain/repositories/cadastro_veiculo_repository.dart';
import 'package:e_mobi/views/features/drivers/domain/usecases/avaliar_motorista_usecase.dart';
import 'package:e_mobi/views/features/drivers/domain/usecases/cadastro_motorista_usecase.dart';
import 'package:e_mobi/views/features/drivers/domain/usecases/cadastro_veiculo_usecase.dart';
import 'package:e_mobi/views/features/drivers/presentation/blocs/meus_alunos/meus_alunos_bloc.dart';
import 'package:e_mobi/views/features/drivers/presentation/blocs/motorista/cadastro_motorista_bloc.dart';
import 'package:e_mobi/views/features/parents/data/datasource/parents_datasource_impl.dart';
import 'package:e_mobi/views/features/parents/data/repositoires/parents_repository_impl.dart';
import 'package:e_mobi/views/features/parents/domain/repositories/parent_repository.dart';
import 'package:e_mobi/views/features/parents/domain/usecases/confirmar_desembarque_usecase.dart';
import 'package:e_mobi/views/features/parents/domain/usecases/confirmar_embarque_usecase.dart';
import 'package:e_mobi/views/features/parents/domain/usecases/confirmar_vinculo_motorista_usecase.dart';
import 'package:e_mobi/views/features/parents/domain/usecases/get_meu_desembarque.dart';
import 'package:e_mobi/views/features/parents/domain/usecases/get_meu_embarque_usecase.dart';
import 'package:e_mobi/views/features/parents/domain/usecases/get_meu_trajeto_motorista_usecase.dart';
import 'package:e_mobi/views/features/parents/domain/usecases/get_meu_veiuculo_usecase.dart';
import 'package:e_mobi/views/features/parents/domain/usecases/get_meus_alunos_usecase.dart';
import 'package:e_mobi/views/features/parents/domain/usecases/get_status_vinculo_motorista_usecase.dart';
import 'package:e_mobi/views/features/upload/data/repositories/upload_document_datasource_impl.dart';
import 'package:e_mobi/views/features/upload/domain/repositories/i_ipload_repository.dart';
import 'package:e_mobi/views/features/upload/domain/usecase/upload_document_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../views/features/authentication/data/repositories/authentication_repository_impl.dart';
import '../../views/features/authentication/domain/repositories/authentication_repository.dart';
import '../../views/features/authentication/domain/usecases/authentication_usecase.dart';
import '../../views/features/drivers/presentation/blocs/bloc/desembarque_bloc.dart';
import '../../views/features/upload/data/datasource/remote_upload_datasource.dart';

final getIt = GetIt.instance;

Future<void> initializeDepencyInjection() async {
  getIt.registerLazySingleton(() => AuthenticationBloc());
  getIt.registerLazySingleton(() => CadastroMotoristaBloc());
  getIt.registerLazySingleton(() => CepBloc());
  getIt.registerLazySingleton(() => CadastroAlunoBloc());
  getIt.registerLazySingleton(() => MeusFilhosBloc());
  getIt.registerLazySingleton(() => DesembarqueBloc());

  getIt.registerLazySingleton(() => MeusAlunosBloc());

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

  //UPLOAD DOCUMENTS
  getIt.registerLazySingleton<RemoteUploadDataSourceImpl>(
    () => RemoteUploadDataSourceImpl(
      client: getIt(),
      netWorkInfoImpl: getIt(),
    ),
  );
  getIt.registerLazySingleton<RemoteCepDataSourceImpl>(
    () => RemoteCepDataSourceImpl(
      client: getIt(),
      netWorkInfo: getIt(),
    ),
  );

  getIt.registerLazySingleton<CadastroMotoristaDataourceImpl>(
    () => CadastroMotoristaDataourceImpl(
      client: getIt(),
      netWorkInfoImpl: getIt(),
    ),
  );
  getIt.registerLazySingleton<CadastroVeiculoDatasourceImpl>(
    () => CadastroVeiculoDatasourceImpl(
      client: getIt(),
      netWorkInfoImpl: getIt(),
    ),
  );

  getIt.registerLazySingleton<CadastroAlunoDataourceImpl>(
    () => CadastroAlunoDataourceImpl(
      client: getIt(),
      netWorkInfoImpl: getIt(),
    ),
  );
  getIt.registerLazySingleton<ParentsDatasourceImpl>(
    () => ParentsDatasourceImpl(
      client: getIt(),
      netWorkInfoImpl: getIt(),
    ),
  );

  getIt.registerLazySingleton<IParentRepository>(
      () => ParentsRepositoryimpl(parentDatasource: getIt()));

  getIt.registerLazySingleton<IAuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(
          remoteAuthenticationDataSourceImpl: getIt()));
  getIt.registerLazySingleton<ICadastroMotoristaRepository>(() =>
      CadastroMotoristaRepositoryimpl(cadastroMotoristaDataourceImpl: getIt()));

  getIt.registerLazySingleton<IUploadDocumentRepository>(
      () => UploadDocumentRepositoryImpl(remoteUploadDataSourceImpl: getIt()));

  getIt.registerLazySingleton<ICepRepository>(
      () => GetCepRepositoryImpl(remoteCepDataSourceImpl: getIt()));

  getIt.registerLazySingleton<ICadastroVeiculoRepository>(() =>
      CadastroVeiculoRepositoryimpl(cadastroVeiculoDatasourceImpl: getIt()));
  getIt.registerLazySingleton<ICadastroAlunoRepository>(
      () => CadastroAlunoRepositoryimpl(cadastroAlunoDataourceImpl: getIt()));

  // UseCases
  getIt.registerLazySingleton<AuthenticateUseCase>(
      () => AuthenticateUseCase(getIt()));

  getIt.registerLazySingleton<CadastroMotoristaUseCase>(
      () => CadastroMotoristaUseCase(cadastroMotoristaRepository: getIt()));

  getIt.registerLazySingleton<UploadDocumentUseCase>(
      () => UploadDocumentUseCase(getIt()));

  getIt.registerLazySingleton<GetCepUseCase>(
      () => GetCepUseCase(cepRepository: getIt()));

  getIt.registerLazySingleton<CadastroVeiculoUseCase>(
      () => CadastroVeiculoUseCase(cadastroVeiculoRepository: getIt()));

  getIt.registerLazySingleton<CadastroAlunoUseCase>(
      () => CadastroAlunoUseCase(cadastroMotoristaRepository: getIt()));

  getIt.registerLazySingleton<GetFilhosUseCase>(
      () => GetFilhosUseCase(cadastroMotoristaRepository: getIt()));

  getIt.registerLazySingleton<AvaliarMotoristaUseCase>(
      () => AvaliarMotoristaUseCase(cadastroMotoristaRepository: getIt()));

  getIt.registerLazySingleton<GetMeusAlunosMotoristaUseCase>(
      () => GetMeusAlunosMotoristaUseCase(iParentRepository: getIt()));
  getIt.registerLazySingleton<ConfirmarEmbarqueMotoristaUseCase>(
      () => ConfirmarEmbarqueMotoristaUseCase(iParentRepository: getIt()));
  getIt.registerLazySingleton<ConfirmarDeEmbarqueMotoristaUseCase>(
      () => ConfirmarDeEmbarqueMotoristaUseCase(iParentRepository: getIt()));
  getIt.registerLazySingleton<ConfirmarVinculoMotoristaUseCase>(
      () => ConfirmarVinculoMotoristaUseCase(iParentRepository: getIt()));

  getIt.registerLazySingleton<GetMeuDesembarqueMotoristaUseCase>(
      () => GetMeuDesembarqueMotoristaUseCase(iParentRepository: getIt()));

  getIt.registerLazySingleton<GetMeuEmbarqueMotoristaUseCase>(
      () => GetMeuEmbarqueMotoristaUseCase(iParentRepository: getIt()));

  getIt.registerLazySingleton<GetMeuTrajetoMoristaUseCase>(
      () => GetMeuTrajetoMoristaUseCase(iParentRepository: getIt()));

  getIt.registerLazySingleton<GetMeuVeiculoUseCase>(
      () => GetMeuVeiculoUseCase(iParentRepository: getIt()));

  getIt.registerLazySingleton<GetStatusVinculoMotoristaUseCase>(
      () => GetStatusVinculoMotoristaUseCase(iParentRepository: getIt()));
}
