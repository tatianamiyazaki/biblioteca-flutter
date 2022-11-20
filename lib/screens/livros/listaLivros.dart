import 'package:flutter/material.dart';
import '../../database/app_database.dart';
import '../../models/livro.dart';
import 'formularioLivros.dart';

const _tituloAppBar = 'Livros';

class ListaLivros extends StatefulWidget {

  @override
  State<ListaLivros> createState() => _ListaLivrosState();
}

class _ListaLivrosState extends State<ListaLivros> {
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
            Icon(Icons.list_alt_outlined, size: 36.0),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ Colors.blue, Color.fromARGB(255, 212, 247, 255)],
          ),
        ),
        child: FutureBuilder(
            initialData: [],
            future: findAll(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text('Loading'),
                      ],
                    ),
                  );
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                  final List<Livro> livros = snapshot.data as List<Livro>;
                  return ListView.builder(
                    itemBuilder: (context, indice) {
                      final Livro livro = livros[indice];
                      return _ItemLivro(livro);
                    },
                    itemCount: livros.length,
                  );
              }
              return Text('Unkown error');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => FormularioLivros(),
                ),
              )
              .then((value) => setState(() {}),
              );
        },
        child: Icon(
          Icons.book,
          size: 30.0,
        ),
      ),
    );
  }
}

class _ItemLivro extends StatelessWidget {
  final Livro livro;

  _ItemLivro(this.livro);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          livro.name,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          livro.autor +
          '\n' +
          livro.editora +
          '\n' +
          livro.edicao.toString() +
          '\n' +
          livro.anoEdicao.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
