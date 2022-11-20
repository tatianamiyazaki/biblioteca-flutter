import 'package:flutter/material.dart';

import '../../database/app_database.dart';
import '../../models/livro.dart';

const _tituloAppBar = 'Novo Livro';

class FormularioLivros extends StatefulWidget {
  @override
  State<FormularioLivros> createState() => _FormularioLivrosState();
}

class _FormularioLivrosState extends State<FormularioLivros> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _autorController = TextEditingController();

  final TextEditingController _editoraController = TextEditingController();

  final TextEditingController _edicaoController = TextEditingController();

  final TextEditingController _anoEdicaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _tituloAppBar,
              style: TextStyle(fontSize: 26.0),
            ),
            Icon(Icons.book, size: 36.0),
          ],
        ),
      ),
      body: 
      Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ Colors.blue, Color.fromARGB(255, 212, 247, 255)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Nome do Livro',
                  ),
                  style: TextStyle(fontSize: 20.0),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _autorController,
                  decoration: InputDecoration(
                    labelText: 'Autor',
                    hintText: 'Fulano de Tal',
                  ),
                  style: TextStyle(fontSize: 20.0),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _editoraController,
                  decoration: InputDecoration(
                    labelText: 'Editora',
                    hintText: 'Nome da Editora',
                  ),
                  style: TextStyle(fontSize: 20.0),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _edicaoController,
                  decoration: InputDecoration(
                    labelText: 'Edição',
                    hintText: '1',
                  ),
                  style: TextStyle(fontSize: 20.0),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _anoEdicaoController,
                  decoration: InputDecoration(
                    labelText: 'Ano da Edição',
                    hintText: '2002',
                  ),
                  style: TextStyle(fontSize: 20.0),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 36,
                  child: ElevatedButton(
                    child: Text(
                      'Adicionar',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      final String name = _nameController.text;
                      final String autor = _autorController.text;
                      final String editora = _editoraController.text;
                      final String edicao = _edicaoController.text;
                      final int? anoEdicao =
                          int.tryParse(_anoEdicaoController.text);
                      final Livro newLivro = Livro(0, name, autor, editora, edicao, anoEdicao!);
                      save(newLivro).then((id) => Navigator.pop(context));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
