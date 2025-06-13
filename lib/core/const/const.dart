// ignore_for_file: type_literal_in_constant_pattern

import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/messages/messages.dart';

String TOKEN =
    "-OLMASpkeRP8P-UmnPx5tXVbQi9Ea9qg_7VRnDt9-ifTrjYOPTEylEufu30vxlMfCKbAng4pfKco7OPT12rmGYUIqmslQWt1r1J5FohX5Wv0bFgUkNpIOh5YDDJDcpAG";

const String baseDevUrl = "https://emobi.keltecnologia.com.br/";

class GlobalVars {
  static String token =
      "-OLMASpkeRP8P-UmnPx5tXVbQi9Ea9qg_7VRnDt9-ifTrjYOPTEylEufu30vxlMfCKbAng4pfKco7OPT12rmGYUIqmslQWt1r1J5FohX5Wv0bFgUkNpIOh5YDDJDcpAG";
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverFailureMessage;
    case LoginFailure:
      return loginFailureMessage;
    case NetWorkFailure:
      return netWorkFailureMessage;
    case DuplicateFailure:
      return duplicateFailureMessage;
    case InvalidCepFailure:
      return invalidFailureMessage;
    default:
      return 'Unexpected Error';
  }
}
