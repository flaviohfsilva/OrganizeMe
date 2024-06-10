import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../data/http/http_client.dart';
import '../../data/repositories/library_repository.dart';
import '../../stores/library_store.dart';

class Biblioteca extends StatefulWidget {
  @override
  State<Biblioteca> createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
  final TextEditingController _searchController = TextEditingController();
  late LibraryStore _libraryStore;

  @override
  void initState() {
    super.initState();
    _libraryStore = LibraryStore(
      repository: LibraryRepository(
        client: HttpClient(),
      ),
    );
    _libraryStore.getLivros();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LibraryStore>(
      create: (_) => _libraryStore,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              color: blue,
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                children: [
                  Text(
                    'Viaje pelas páginas e\nexplore novos mundos',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.sora(
                      fontSize: 20.0,
                      color: white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Busque por autor, título ou ISBN',
                          hintStyle: TextStyle(color: strongBlue, fontSize: 14),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            color: strongBlue,
                            onPressed: () {
                              _libraryStore.searchLivros(_searchController.text);
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: white,
                        ),
                        style: TextStyle(
                          color: strongBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Consumer<LibraryStore>(
                  builder: (context, store, child) {
                    if (store.erro.value.isNotEmpty) {
                      return Center(child: Text(store.erro.value));
                    }

                    if (store.livroState.value.isEmpty) {
                      return Center(child: Text('Nenhum livro encontrado.'));
                    } else {
                      return ListView.separated(
                        itemCount: store.livroState.value.length,
                        itemBuilder: (context, index) {
                          final book = store.livroState.value[index];
                          return ListTile(
                            leading: Image.network(
                              book.img,
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.broken_image, size: 50.0);
                              },
                            ),
                            title: Text(book.nome),
                            subtitle: Text(book.autor),
                            onTap: () {
                              // Adicione ações ao clicar no livro, se necessário
                            },
                          );
                        },   separatorBuilder: (context, index) => SizedBox(height: 10),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
