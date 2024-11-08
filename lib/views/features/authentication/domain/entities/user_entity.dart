import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final bool? ok;
  final int? id;
  final String? nome;
  final String? dataNascimento;
  final String? celular;
  final String? telefone;
  final String? cep;
  final String? bairro;
  final String? endereco;
  final String? numero;
  final String? complemento;
  final String? cidade;
  final String? estado;
  final String? escola;
  final String? serie;
  final String? enderecoEmbarque;
  final String? enderecoEmbarqueNumero;
  final String? cpf;
  final String? rg;
  final String? senha;
  final String? email;
  final String? documentoAluno;
  final String? paiResponsavel;
  final String? tipo;
  final List<DocumentoEntity>? documentos;

  const UserEntity({
    this.ok,
    this.id,
    this.nome,
    this.dataNascimento,
    this.celular,
    this.telefone,
    this.cep,
    this.bairro,
    this.endereco,
    this.numero,
    this.complemento,
    this.cidade,
    this.estado,
    this.escola,
    this.serie,
    this.enderecoEmbarque,
    this.enderecoEmbarqueNumero,
    this.cpf,
    this.rg,
    this.senha,
    this.email,
    this.documentoAluno,
    this.paiResponsavel,
    this.tipo,
    this.documentos,
  });

  @override
  List<Object?> get props => [
        ok,
        id,
        nome,
        email,
        telefone,
        cep,
        bairro,
        cidade,
        estado,
        escola,
        serie,
        enderecoEmbarque,
        cpf,
        rg,
        senha,
        email,
        documentoAluno,
        paiResponsavel,
        tipo,
        documentos
      ];
}

class DocumentoEntity {
  final int? id;
  final String? tipo;
  final String? documento;

  DocumentoEntity({
    this.id,
    this.tipo,
    this.documento,
  });
}
