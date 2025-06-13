part of 'desembarque_bloc.dart';

@immutable
sealed class DesembarqueState {}

final class DesembarqueInitial extends DesembarqueState {}

class DesembarqueLoading extends DesembarqueState {
  final String message;
  DesembarqueLoading({required this.message});
}

class DesemmbarqueErrorEror extends DesembarqueState {
  final String message;
  DesemmbarqueErrorEror({required this.message});
}

class DesembarqueSuccess extends DesembarqueState {
  final String message;
  final List<DesembarqueModel> data;
  DesembarqueSuccess({required this.message, required this.data});
}
