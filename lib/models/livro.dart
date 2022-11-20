class Livro {
  final int id;
  final String name;
  final String autor;
  final String editora;
  final String edicao;
  final int anoEdicao;

  Livro(
    this.id,
    this.name,
    this.autor,
    this.editora,
    this.edicao,
    this.anoEdicao,
  );

  @override
  String toString() {
    return 'Livro {id: $id, name: $name, autor: $autor, editora: $editora, edicao: $edicao, anoEdicao: $anoEdicao}';
  }
}
