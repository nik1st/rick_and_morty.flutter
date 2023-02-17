import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/service.dart';
import 'package:rick_and_morty/home/view/character_cell.dart';
import 'package:rick_and_morty/details/character_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Service service = Service();
  final ScrollController _scrollController = ScrollController();
  final List<Character> _data = [];
  late Future<CharactersResponse> _result;
  late int _pagesCount;
  bool _isNextPageLoading = false;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _result = service.fetchCharacters(_currentPage);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          _isNextPageLoading = true;
          _result = service.fetchCharacters(_currentPage + 1);
        });
      }
    });
  }

  void onTap(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Details(id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty'),
      ),
      body: Center(
          child: FutureBuilder(
        future: _result,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done &&
              !_isNextPageLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Text('Error :(');
          }
          if (!snapshot.hasData) {
            return const Text('No characters, sadge :(');
          }
          _isNextPageLoading = false;
          _pagesCount = snapshot.data?.pagesCount ?? 0;
          _currentPage++;
          _data.addAll(snapshot.data?.results as List<Character>);

          return ListView.builder(
            controller: _scrollController,
            itemCount: _data.length + 1,
            itemBuilder: (context, index) {
              if (index < _data.length) {
                return CharacterCell(_data[index], onTap);
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: _currentPage < _pagesCount
                        ? const CircularProgressIndicator()
                        : const Text('no more data to load :)'),
                  ),
                );
              }
            },
          );
        },
      )),
    );
  }
}
