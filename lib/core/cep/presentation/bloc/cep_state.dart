part of 'cep_bloc.dart';

@immutable
sealed class CepState {}

final class CepInitial extends CepState {}

final class CepLoadingState extends CepState {}

final class CepInvalidState extends CepState {
  final String errorMessage;
  CepInvalidState({required this.errorMessage});
}

final class CepSuccessState extends CepState {
  final CepModelo cepModelo;
  CepSuccessState({required this.cepModelo});
}
