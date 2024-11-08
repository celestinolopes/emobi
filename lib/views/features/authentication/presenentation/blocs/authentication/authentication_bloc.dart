import 'package:bloc/bloc.dart';
import 'package:e_mobi/core/di/di_container.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/messages/messages.dart';
import 'package:e_mobi/views/features/authentication/data/models/user_model.dart';
import 'package:e_mobi/views/features/authentication/domain/usecases/authentication_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    String mapFailureToMessage(Failure failure) {
      switch (failure.runtimeType) {
        case ServerFailure:
          return serverFailureMessage;
        case LoginFailure:
          return loginFailureMessage;
        case NetWorkFailure:
          return netWorkFailureMessage;
        default:
          return 'Unexpected Error';
      }
    }

    on<LoginEvent>((event, emit) async {
      emit(AuthenticationInitial());
      if (event.username.isEmpty) {
        emit(const AuthenticationValidatorState(
            message: "Por favor digite o seu nome de usuário"));
      } else if (event.password.isEmpty) {
        emit(const AuthenticationValidatorState(
            message: "Por favor digite a sua senha"));
      } else {
        emit(AuthenticationLoadingState());

        final failureOrSuccess = await getIt<AuthenticateUseCase>().call(
          AuthParams(username: event.username, password: event.password),
        );
        failureOrSuccess.fold((left) {
          emit(AuthenticationError(message: mapFailureToMessage(left)));
        }, (right) {
          emit(AuthenticationSuccessState(authModel: right as UserModel));
        });
      }
    });
  }
}
