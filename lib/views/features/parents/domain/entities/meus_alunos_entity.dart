class MeusAlunosEntity {
  final bool? ok;
  final List<AlunoEntity>? alunos;

  MeusAlunosEntity({
    this.ok,
    this.alunos,
  });
}

class AlunoEntity {
  final int? id;
  final String? nome;
  final String? dataNascimento;
  final String? escola;
  final String? serie;

  AlunoEntity({
    this.id,
    this.nome,
    this.dataNascimento,
    this.escola,
    this.serie,
  });
}
